[sval, slag] = findpeaks(ac, 'MinPeakDistance', 0.3*fs); % finds peaks of the autocorrelation
[lval, llag] = findpeaks(sval);
pts = slag(llag);
display(pts);
ns = [pts(1); diff(pts)]; % nummber of samples between adjacent peaks
display(ns);