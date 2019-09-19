# Electrical Engineering
This repository houses some of the files I have needed thorughout my Electrical Engineering coursework. This includes strategies for circuit analysis, circuit design, and signal processing.

## circuits
These Matlab scripts have been used to solve circuit diagrams, assist with circuit design, or interpret given signals.

## visualizer
Some music visualizers (think of old iTunes or Windows Media Player) will plot based on frequency. To accomplish this, a '.wav' (i.e--a song sampled far beyond the [Nyquist](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem) standard) was imported into the MATLAB script, where a time segment of the signal was defined. This time signal was then changed to a signal in the frequency domain with a Fast [Fourier Transform](https://en.wikipedia.org/wiki/Fourier_transform). Sit back and watch the beat.
