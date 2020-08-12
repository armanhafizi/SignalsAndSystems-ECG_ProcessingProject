%% Comparison
%% Part 1 - Up Sampling
% Upsampling both of the signals to their least common multiple.
healthy = load('..\Mandatory\Data.mat');
sig_h = healthy.data.signal;
fs_h = healthy.data.samplingfreq;
ill = load('patient1.mat');
sig_i = ill.val./1000;
fs_i = 360;
sig_h = upsample(sig_h, lcm(fs_h, fs_i)/fs_i);
sig_i = upsample(sig_i, lcm(fs_h, fs_i)/fs_h);
%% Part 2 - Disease Distinguish
% Since the patient has the heart rate of 35 beats per minute, he is
% probably involved with a heart disease. According to the resting heart
% rate chart, a normal person should have the heart rate between 50 bpm to
% 80 bpm.