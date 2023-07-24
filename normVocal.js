const child_process = require("child_process");
const fs = require("node:fs");

// Regex for first pass results
const regex = /measured_I=(-?\d+\.\d+):measured_LRA=(-?\d+\.\d+):measured_tp=(-?\d+\.\d+):measured_thresh=(-?\d+\.\d+)/;

module.exports = {
    async execute() {
        return new Promise((resolve, reject) => {
            const vocalFile = fs.readdirSync('./generatedVoice')[0];
            //Run ffmpeg to merge the audio
            const ffmpeg = child_process.spawn('ffmpeg', ['-i', `./generatedVoice/${vocalFile}`, '-filter:a', '"volume=1.8"', `./generatedVoice/Boosted${vocalFile}`, '-y'], {shell: true});

            ffmpeg.on("error", (e) => {
                console.log(e);
            })

            // collect data from script
            ffmpeg.stdout.on('data', function (data) {
                const res = data.toString().match(regex);
                console.log('Pipe data from python script ...');
                console.log(data.toString());
            });

            // in close event we are sure that stream from child process is closed
            ffmpeg.on('close', (code) => {
                console.log(`child process close all stdio with code ${code}`);
                if (code === 0) {
                    fs.unlinkSync(`./generatedVoice/${vocalFile}`);
                    resolve(0);
                }else {
                    reject(-1);
                }

                ffmpeg = child_process.spawn('ffmpeg', [])
            });
        })
    }
}
