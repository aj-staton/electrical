# Electrical Engineering
This repository houses some of the files I have needed thorughout my Electrical Engineering coursework. This includes strategies for circuit analysis, circuit design, and signal processing.

## circuits
These Matlab scripts have been used to solve circuit diagrams, assist with circuit design, or interpret given signals. Topics for solutions include Mesh/Nodal analysis, Thevenin transformations, and Fourier transforms.

It is highly unlikely that these scripts will be directly useful to my future self or others. Each circuit has is own components, with thier own original connections. The scripts are meant to serve as a reference and reminder for my pattern of thoughts for solving these problems. 

## visualizer
Some music visualizers (think of old iTunes or Windows Media Player) will plot based on frequency. To accomplish this, a '.wav' (i.e--a song sampled far beyond the [Nyquist](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem) standard) was imported into the MATLAB script, where a time segment of the signal was defined. This time signal was then changed to a signal in the frequency domain with a Fast [Fourier Transform](https://en.wikipedia.org/wiki/Fourier_transform). Sit back and watch the beat.

To use the script for other songs, place a '.wav' file into the same directory as the script (or update the script's file path). Then edit the following line in MATLAB with that song's filename:
```matlab
file = "Lindecis-Soulful.wav";
```
