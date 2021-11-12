%-------------------------------------------------
%                   Ejercicio 2 
%-------------------------------------------------
delta_t=0.001;
f0=2000;
t=(0:delta_t:3);
y=cos(t.*2*pi*f0); 
fs1=3000;
fs2=5000;
fs3=2500;
sound(y,fs1);
Ts=1;  

[xd, tsamp] = conv_cd(y,t,1/fs1);
[xd1, tsamp1] = conv_cd(y,t,1/fs2);
[xd2, tsamp2] = conv_cd(y,t,1/fs3);
figure(1)

hold on;
plot(tsamp,xd)
hold off;
% Señal reconstruida en el tiempo
for k = 1:length(t)
    hi = filtro_ideal(t(k)-tsamp, Ts);
    xr0(k) = sum(xd.*hi);
end

for k = 1:length(t)
    hi = filtro_ideal(t(k)-tsamp1, Ts);
    xr1(k) = sum(xd1.*hi);
end

for k = 1:length(t)
    hi = filtro_ideal(t(k)-tsamp2, Ts);
    xr2(k) = sum(xd2.*hi);
end

figure(2); 
hold on;
 

plot(t,xr1,'b');%la señal reconstruida en verde.
plot(t,xr2,'r');%la señal reconstruida en verde.
plot(t,xr0,'g');%la señal reconstruida en verde.
hold off;
