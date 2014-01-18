dotAstroPlayer
==============

An interface to .Astronomy conference talks - displays slides, audio, video clips as well as synced tweets and notes.

Recipe
======

Before you start make sure you have a `dotastro.config` file that contains the locations of `VLC`, `ffmpeg` and `convert`:

````
VLC	/path/to/VLC
ffmpeg	/path/to/ffmpeg
convert	convert
````

To make a talk ready for the web:

1. Save the talk PDF and video to the `mytalk/source/` directory.
1. Extract the slides from the PDF. This step saves intermediate files in the format `slide-NN.png` within the source directory. If you have something other than a PDF you'll have to find your own way to extract the slides.
    
        perl webify.pl -extractslides=mytalk/source/mytalk_slides.pdf
1. Extract the audio from the video. This step saves this intermediate file to the source directory as `extracted.wav`.
    
        perl webify.pl -extractaudio=mytalk/source/mytalk.mov
1. If there is a demo in the talk that needs video, you can extract that part from the main video. This extracted part is saved to the source directory as `extracted.mp4`. If you need to extract multiple parts you'll want to rename them between each extraction.
    
        perl webify.pl -extractvideo=mytalk-source/mytalk.mov -start=19:53 -end=36:48
1. At this stage I've already created a setup.txt file but for other talks you can create a placeholder:
    
        perl webify.pl mytalk/ -source=mytalk/source/ -setup
1. Edit the `mytalk/setup.txt` file so that the meta data is correct and the times for the slides are correct. This is the step that requires the majority of the human input as you'll need to work out the timings.
1. Now you need to create all the slides, audio and video files that will be used by the webpage. These get saved in the `mytalk/` directory.
    
        perl webify.pl mytalk/ -source=mytalk/source/ -makeslides -makeaudio -makevideo
1. If you need to re-generate the HTML without needing to re-make the slides/audio/video just run:
    
        perl webify.pl mytalk/ -source=mytalk/source/

The result should be that the output directory `mytalk/` now contains all the slides (3 sizes of each), audio (MP3 and OGG), video extracts (MP4, WebM) and an `index.html` file (as well as the original `setup.txt` file).
