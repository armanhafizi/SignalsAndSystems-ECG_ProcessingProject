[wd,lo,hi,power]=obw(lnr,fs);
b = hi.*ny./fs; % stop band
hb = floor(b); % high band
lb = ceil(-1.*b); % lower band
snr_inc_f = zeros(ny,1); % SNR increasing
for i=1:ny
    if (i>=lb+ny/2+1 && i<=hb+ny/2+1)
        snr_inc_f(i)=lnr_f(i); % ideal low pass filter
    end
end
snr_inc = ifft(ifftshift(snr_inc_f));
figure(5);
subplot(3,1,1);
plot(t,snr_inc);
ylabel(unit);
xlabel('Time(s)');
title('Preprocessing - Part 5: SNR Increased');
subplot(3,1,2);
stem(fd_f, abs(snr_inc_f));
xlabel('frequency');
ylabel('absolute magnitude');
title('Preprocessing - Part 5: Absolute Magnitude');
subplot(3,1,3);
stem(fd_f, angle(snr_inc_f));
xlabel('frequency');
ylabel('angle');
title('Preprocessing - Part 5: Angle Phase');