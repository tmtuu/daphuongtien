fs = 8192;
[data, fs] = audioread('orig_input.wav');  
[rows colums] = size(data);                
t = 0 : 1/fs : 0.3;                        
fla2 = 880;
fsol2 = 792;
ffa2 = 704;
fmi2 = 660;
fre2 = 586;
fdo2 = 528;
fsi = 495;
fla = 440;
fsol = 396;
ffa = 352;
fmi = 330;
fre = 293;
fdo = 264;
A0 = .7;
A1 = .6; A2 = .5; A3 = .4; A4 = .3; A5 = .2; A6 = .1;   
w = 0; 
la2 = A1 *sin( 2 * pi * fla2 * t + w );
sol2 = A2 *sin( 2 * pi * fsol2 * t + w );
fa2 = A3 *sin( 2 * pi * ffa2 * t + w );
mi2 = A4 *sin( 2 * pi * fmi2 * t + w );
re2 = A5 *sin( 2 * pi * fre2 * t + w );
do2 = A6 *sin( 2 * pi * fdo2 * t + w );
si = A0 *sin( 2 * pi * fsi * t + w );
la = A1 *sin( 2 * pi * fla * t + w );
sol = A2 *sin( 2 * pi * fsol * t + w );
fa = A3 *sin( 2 * pi * ffa * t + w );
mi = A4 *sin( 2 * pi * fmi * t + w );
re = A5 *sin( 2 * pi * fre * t + w );
do = A6 *sin( 2 * pi * fdo * t + w );
y= [sol sol2 mi2 mi2 re2 do2 re2 do2 sol sol2 mi2 mi2 re2 do2 re2 mi2 sol sol2 mi2 mi2 re2 do2 re2 mi2 sol sol2 mi2 mi2 re2 do2 re2 mi2 ]; 
k = y(1:length(data));
%Tron 2 tin hieu lai voi nhau
for i = 1:colums
    for j = 1:rows
        k(j+i) = data(j,i) + y(i+j);
        
    end
end

audiowrite('meloly.wav', k, fs);             
[data_meloly, fs_meloly] = audioread('meloly.wav');
sound(data_meloly, fs_meloly);

Y = fft(k);
plot(abs(k))

N = fs
transform = fft(k,N)/N;
magTransform = abs(transform);

faxis = linspace(-fs/2,fs/2,N);
plot(faxis,fftshift(magTransform));
xlabel('Frequency (Hz)')


axis([0 length(faxis)/2, 0 max(magTransform)]) 


xt = get(gca,'XTick');  
set(gca,'XTickLabel', sprintf('%.0f|',xt))


win = 128 

hop = win/2            

nfft = win 
spectrogram(k,win,hop,nfft,fs,'yaxis')


yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt))

