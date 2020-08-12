%% Processing
%% Part 1 - Autocorrelation
% *SAME AS BEFORE*
figure(1);
sig = snr_inc; % final preprocessed signal
ac = autocorr(sig, length(sig)/2);
plot(ac);
title('Processing - Part 1: Autocorrelation');
%% Part 2 - A Visual Guess
% *SAME AS BEFORE*
nv = 500;
display(nv);
%% Part 3 - Find Peaks
% *SAME AS BEFORE*
[sval, slag] = findpeaks(ac, 'MinPeakDistance', 0.3*fs); % finds peaks of the autocorrelation
[lval, llag] = findpeaks(sval);
pts = slag(llag); % heart stroke sample #
display(pts);
ns = [pts(1); diff(pts)]; % nummber of samples between adjacent peaks
display(ns);
%% Part 4 - Average Sample Numbers
% *SAME AS BEFORE*
avg_s = mean(ns);
display(avg_s);
%% Part 5 - Average Time
% *SAME AS BEFORE*
avg_t = avg_s./fs; % average time between heart strokes
display(avg_t);
%% Part 6 - Heart Rate (HR)
% *SAME AS BEFORE*
hr = 60/avg_t; % caluclates heart rate
display(hr);
%% Part 7 - Power Spectrum Density (PSD)
% *SAME AS BEFORE*
ac_f = fftshift(fft(ac));
n_ac = length(ac_f);
fac_f = (-n_ac/2:n_ac/2-1)*(fs/n_ac);
figure(2);
plot(fac_f, abs(ac_f));
xlabel('frequency');
ylabel('absolute magnitude');
title('Processing - Part 7: PSD');
figure(3);
plot(fac_f, angle(ac_f));
xlabel('frequency');
ylabel('angle phase');
title('Processing - Part 7: PSD');