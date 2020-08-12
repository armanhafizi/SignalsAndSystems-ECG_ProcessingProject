cof = 2; % cut off frequency
b = cof.*ny./fs; % stop band
hb = floor(b); % high band
lb = ceil(-1.*b); % lower band
mar_f = d_f; % motion artifact removed
mar_f([lb+ny/2+1:hb+ny/2+1])=0; % ideal high pass filter
figure(3);
mar = ifft(ifftshift(mar_f));
subplot(3,1,1);
plot(t,mar);
ylabel(unit);
xlabel('Time(s)');
title('Preprocessing - Part 3: Motion Artifact Removed');
subplot(3,1,2);
stem(fd_f, abs(mar_f));
xlabel('frequency');
ylabel('absolute magnitude');
title('Preprocessing - Part 3: Absolute Magnitude');
subplot(3,1,3);
stem(fd_f, angle(mar_f));
xlabel('frequency');
ylabel('angle');
title('Preprocessing - Part 3: Angle Phase');