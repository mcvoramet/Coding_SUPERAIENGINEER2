function [fd, f, mag]= doubSpec(signal,T)
N= length(signal);
fd= 1/(N*T); 
f= [0:fd:(N-1)*fd];
[M, N]= size(signal);
mag= [];
for i= 1:M
    Y= T*fft(signal(i,:)); %Fourier Transform of signal 
    MY= abs(Y);
    MYdb= MY(1:N); %Only the first half b/c the remainder is redundant
    mag= [mag; MYdb];
end