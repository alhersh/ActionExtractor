function frame = getFrame(videoSource,frameTime)
        videoSource.CurrentTime= (frameTime / 1000);
        frame = readFrame(videoSource);
end