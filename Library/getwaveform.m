function data = getwaveform()
%%% the function to get the envelop
nn = 1:1000;
data = sin( 2*pi* 1.*(nn/1000)).';
end