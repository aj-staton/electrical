%{
Written by Austin Staton for use in "Signals and Systems" 
at the University of South Carolina.
Date:  16 Apr 2019 

This code takes in a song, then uses its waveform as a signal to take a fourier
transform and generates a visualizer. This visualizer plots the amplitude of the wave
form vs. the frequency the of the wave.

Credit: Not all of this code is not my own, original thought. Dr. Mvs Chandrashekar
provided the approach to creating this visualizer and some sample code.
%}

clc;
clear all;
close all;

% file = "Jinsang-Quiet.wav";
file = "Lindecis-Soulful.wav";
disp(strcat("Visualizing the song: ", file));
% The audioread() function will return the sample data and a sampling rate.
[y, Fs] = audioread(file);
player = audioplayer(y,Fs);

% STD : player.TimerPeriod=0.025;
player.TimerPeriod = 0.1;
player.play;

%{
% This block can plot the song wave as a fuction of time, if neccessary.
figure(1)
% plot((y))
plot(fft(y))
title(strcat('Audio Signal Waveform for:  ', file))
xlabel('Time'), ylabel('Amplitude')
%}

%{
This loop controls the continous updating of the Visualizer in time.
%}
while(player.isplaying)
  UpdatingFFT(player,y,Fs, file);
  drawnow;
end
%
player.stop;

%{
UpdatingFFT is a function that implements the fast fourier transform continuously in order to sample
and update a visualizer. 

This function is not my own original thought. It is a modified and refactored version of a
function given by Dr. Mvs Chandrashakar.
%}
function UpdatingFFT(player,Y,FS, SongTitle)
    sampleNumber=get(player,'CurrentSample');
    timerVal=get(player,'TimerPeriod');
    
    % This creates the sample window to stake the fourier transform of.
    %   If we LOWER this window, the computations become less intensive;
    %   thus, the visualizer is more in sync with the music.
    sample_window = Y(floor(sampleNumber-((timerVal*FS)/2)):floor(sampleNumber+((timerVal*FS)/2)),1);
    
    n = length(sample_window);
    
    transformed_window = fft(sample_window); % Double take the fourier transform of the sample window. 
    
    nUniquePts = ceil((n+1)/2);
    
    % Select just the first half of the window since the second half
    %   is a mirror image of the first.
    transformed_window = transformed_window(1:nUniquePts); 
    
    % Take the absolute value, or the magnitude.
    transformed_window = abs(transformed_window); 
    
    % Scale by the number of points so that the magnitude does not depend on the length
    %   of the signal or on its sampling frequency.
    transformed_window = transformed_window/n; 
    
    transformed_window = transformed_window.^2;  % Square it to get the power
   
    % Multiply by two
    if rem(n, 2) % Odd nfft excludes Nyquist point
        transformed_window(2:end) = transformed_window(2:end)*2;
    else
        transformed_window(2:end -1) = transformed_window(2:end -1)*2;
    end
    
    % Create the frequency array, which gives a range for the x-axis.
    freqArray = (0:nUniquePts-1) * (FS / n);
    
    % Plotting Functions:
    % h = plot(freqArray/1000, transformed_window, 'r--o');
    % h =stairs(freqArray/1000, transformed_window, 'r-h');
    % h = area(freqArray/1000, transformed_window);
    h = bar(freqArray/1000, transformed_window);
    
    % Coloring of the plot based on the Power of the output.
    if max(transformed_window) < 0.002
        h(1).FaceColor = [1 0 0];
    end
    if max(transformed_window) >= 0.002 && max(transformed_window) < 0.0045
        h(1).FaceColor = [1 1 0];
    end
    if max(transformed_window) >= 0.0045 && max(transformed_window) < 0.007
        h(1).FaceColor = [0 1 0];
    end
    if max(transformed_window) >= 0.007
        h(1).FaceColor = [0 0 0.95];
    end   
    
    % Plot Parameters
    xlabel('Frequency (kHz)'), ylabel('Power (watts)'),... 
        title(SongTitle), axis([0 0.8 0 0.008]), set(gca, 'Color', 'k');
    % Clipping Control
    ax = gca;
    ax.Clipping = 'off';
end

% End Program
   
