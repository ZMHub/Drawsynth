function [out_data, fs] = synth(pitch,getwaveform_func, getenvelop_func, fs)
%%% Synthesizer %%%
% function [out_data, fs] = synth(pitch,getwaveform_func, getenvelop_func, fs)
% Version. 1
% When this function is triggered, it will use getwaveform_func to get
% waveform data and getenvelope_func to get envelope data. Then, based on
% pitch, stretching (resampling) the waveform to the correct frequency.


wf_data = getwaveform_func();
evp_data = getenvelop_func();
fs_wf= length(wf_data) * pitch;
wf_rs_data = resample(wf_data,fs,fs_wf);
aa = length(wf_rs_data);
bb = length(evp_data);
n_ratio = fix(bb/aa);
out_data = ones(bb,1);
for ii = 1:n_ratio  %generate signal
    out_data((ii-1)*aa+1:ii * aa) = evp_data((ii-1)*aa+1:ii * aa) .* wf_rs_data;
end
lastL = length(out_data(ii * aa:end));
out_data(ii * aa:end) = evp_data(1:lastL) .* wf_rs_data(1:lastL);

%sound(out_data,fs);
end
