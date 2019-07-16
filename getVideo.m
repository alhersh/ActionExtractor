function video = getVideo(videoFile)
    disp(['Reading file: ' videoFile]);
    video = VideoReader(videoFile);
end
