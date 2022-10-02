%AM_lineSpec.m
clear all;
close all;
f0= 1; %Fundamental Freq. (Natural Freq.)
P= 6; %Period of signal
%objSinusoid; %call function to generate all sinusoid waveforms
T= 0.005; % Time spacing
fs= 1/T; %Sampling freq.
t= [0:T:(P-T)]; %Time axis, vector
N= length(t); % length of signal waveform 
%
fm= 1; %Message Freq.   
fc= 20; %Carrier Freq.
crr = cos(2*pi*fc*f0*t);
anlgDat = cos(2*pi*fm*f0*t); 
am=(1/2)*(cos(2*pi*(fc+fm)*f0*t)+cos(2*pi*(fc-fm)*f0*t));
figure; subplot(311);plot(t,anlgDat); ylabel('Modulating Signal');
subplot(312);plot(t,crr); ylabel('Carrier');
subplot(313);plot(t,am); ylabel('Modulated Signal');

%Line Spectrum Estimation
sigAll= [anlgDat; crr; am];
[fd, f, mag]= doubSpec(sigAll,T); %call doubleSpectrum function!
figure; subplot(311); plot(f, mag(1,:));
title('\bf Line Spectrum of All Simulated Sinusoids');
xlabel('\bf Frequency in Hz'); ylabel('\bf Magnitude, Arb. unit');
subplot(312); stem(f, mag(2,:));
subplot(313); plot(f, mag(3,:));
mgdbShft= fftshift(mag);
fsR= [0:fd:(N/2-1)*fd];
fsL= [(-(N/2-1):1:0)*fd];
fdbShft= [fsL fsR];
figure,plot(fdbShft,mgdbShft);
title('\bf Shifted Mag. Spec.');
xlabel('\bf Frequency in Hz'); ylabel('\bf Magnitude, Arb. unit');


