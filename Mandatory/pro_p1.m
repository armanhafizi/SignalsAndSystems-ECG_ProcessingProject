figure(6);
sig = snr_inc; % final preprocessed signal
ac = autocorr(sig, length(sig)/2);
plot(ac);
title('Processing - Part 1: Autocorrelation');