clc;
clear all;
close all;

F_d = 100;
t = 1;
freq = 0:0.5:50;
err = zeros(size(freq));
for i = 1:length(freq)
    f = freq(i);
    t_1 = 0:1/F_d:t-1/F_d;
    SIN = sin(2*pi*f*t_1);
    dec = SIN(1:2:end);
    n = length(dec);
    interp = zeros(1, 2*n);
    interpol(1:2:2*n-1) = dec;
    for k = 2:2:2*n-2
        interpol(k) = (interpol(k-1) + interpol(k+1))/2;
    end
    err(i) = sqrt(mean((SIN(1:length(interpol)) - interpol).^2));
    fprintf('%6.1f\t\t%12.4f\n', f, err(i));
end

figure;
plot(freq, err, 'LineWidth', 2);
xlabel('F Hz');
ylabel('ERR');
title('ERR INTERPOLATION DECIMATION');
grid on
