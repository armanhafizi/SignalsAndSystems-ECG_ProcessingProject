fn = 50; % notch frequency
bw = 120; % bandwidth
apass = 1; % bandwidth attenuation
[b,a]=iirnotch(fn/(fs/2),bw/(fs/2),apass);
hd=dfilt.df2(b,a);
r = mar./max(mar);
lnr=filter(hd,r); % line noise removed
figure(4);
subplot(3,1,1);
plot(t,lnr);
ylabel(unit);
xlabel('Time(s)');
title('Preprocessing - Part 4: Line Noise Removed');
y2 = fft(lnr);
lnr_f = fftshift(y2);
ny2 = length(y2);
flnr_f = (-ny2/2:ny2/2-1)*(fs/ny2);
subplot(3,1,2);
stem(flnr_f, abs(lnr_f));
xlabel('frequency');
ylabel('absolute magnitude');
title('Preprocessing - Part 4: Absolute Magnitude');
subplot(3,1,3);
stem(flnr_f, angle(lnr_f));
xlabel('frequency');
ylabel('angle');
title('Preprocessing - Part 4: Angle Phase');