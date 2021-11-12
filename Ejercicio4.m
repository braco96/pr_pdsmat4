%-------------------------------------------------
%                   Ejercicio 4 . 
%-------------------------------------------------


[voz_original,fs] = audioread('speech.wav'); 
t = linspace(0,4,length(voz_original)); 

fs41=8000;
fs42=4000;
fs43=2000;  

[xd41, tsamp41] = conv_cd(voz_original,t,1/fs41); 
[xd42, tsamp42] = conv_cd(voz_original,t,1/fs42);
[xd43, tsamp43] = conv_cd(voz_original,t,1/fs43);
plot(tsamp,xd)

% Señal reconstruida en el tiempo
for k = 1:length(t)
    hi41 = filtro_ideal(t(k)-tsamp41, 0.01);
    hi42 = filtro_ideal(t(k)-tsamp42, 0.01);
    hi43 = filtro_ideal(t(k)-tsamp43, 0.01);
    xr41(k) = sum(xd41.*hi41);
    xr42(k) = sum(xd42.*hi42);
    xr43(k) = sum(xd43.*hi43);
end
 
figure(3); 
hold on ;
plot(t,xr41,'b');% la señal reconstruida en verde .
plot(t,xr42,'r');% la señal reconstruida en verde.
plot(t,xr43,'g');% la señal reconstruida en verde.
hold off;
 