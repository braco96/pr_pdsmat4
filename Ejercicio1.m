%-------------------------------------------------
%                   Ejercicio 1 
%-------------------------------------------------
delta_t=0.001;
f0=5;
t = (-2:delta_t:2);
y=sin(t.*f0*2*pi)

Ts=0.25;  
[xd, tsamp] = conv_cd(y,t,Ts);

% Señal reconstruida en el tiempo
for k = 1:length(t)
    hi = filtro_ideal(t(k)-tsamp, Ts);
    xr(k) = sum(xd.*hi);
end
figure(1);
plot(t, y, 'b'); % la señal continua en el tiempo en azul.
hold on;

stem(tsamp,xd,'r'); % las muestras discretas.
plot(t,xr,'g');%la señal reconstruida en verde.
hold off;
