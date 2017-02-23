%%% test script
clear all; close all;
%%%% pitchs table %%%%
Rlt = @(Base,ii)fix(Base *2^(ii/12));
A4 = 440; A5 = A4 *2;
C4 = Rlt(A4,-9);D4 = Rlt(A4,-7);E4 = Rlt(A4,-5);F4 = Rlt(A4,-4);G4 = Rlt(A4,-2);B4 = Rlt(A4,2);
C5 = Rlt(A5,-9);D5 = Rlt(A5,-7);E5 = Rlt(A5,-5);F5 = Rlt(A5,-5);G5 = Rlt(A5,-2);B5 = Rlt(A5,2);
%%%% End pitches table
%pitchs = [A4,E4,C4,A4,C5,E5,A4,G5];
pitchs = [C4,E4,G4,C5];

fs = 44100;
for ii = 1: length(pitchs)
    pitch = pitchs(ii);
xt = getwaveform();
env = getenvelop();

%synthesis signal
[outdata, fs_o] = synth(pitch,@getwaveform,@getenvelop,fs);

%% plot input signal
% figure;
% plot(length(xt),xt);
% xlabel n
% title xt
% 
% figure;
% plot(1:length(env),env);
% xlabel n
% title envelop
% 
% figure;
% plot(1:length(outdata),outdata);
% xlabel n
% title outdata

sound(outdata,fs);
%pause(.1);
end