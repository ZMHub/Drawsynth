function [env,fs] = getenvelop()
%%% the function to get the envelop
fs = 44100;

%env 1 ADSR
env = ones(2*44100,1);
env(1:fs/2) = (1:fs/2)/fs*4;
env(fs/2:3/4*fs) = linspace(2,1,length(env(fs/2:3/4*fs)));
env(3/4*fs:3/2*fs) = 1;
env(3/2*fs:end) = linspace(env(7/4*fs),0,length(env(3/2*fs:end)));





end