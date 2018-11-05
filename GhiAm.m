load handel.mat
fs=8192;
q1 = audiorecorder;
disp('Start speaking.')
recordblocking(q1, 8);
disp('End of Recording.');
w1 = getaudiodata(q1);
filename = 'orig_input.wav';
audiowrite(filename,w1,fs)
[y,Fs] = audioread('orig_input.wav');
