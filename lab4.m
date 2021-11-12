


% -------------------------------------------------
%                   Ejercicio 3
% -------------------------------------------------

[voz_original,fs] = audioread('speech.wav'); 
t = linspace(0,2,length(voz_original)); 

voz_expand = zeros(1,2*length(voz_original));
voz_expand(1:2:end) = voz_original; 
t0 = linspace(0,2,length(voz_expand)); 

% -------------------------------------------------
%                   Ejercicio 4
% ------------------------------------------------- 
[voz_original,fs] = audioread('speech.wav'); 
t = linspace(0,2,length(voz_original)); 
voz_expand = zeros(1,2*length(voz_original));
voz_expand(1:2:end) = voz_original; 
fs1=8000;
fs2=4000;
fs3=2000;
sound(y,fs3);
Ts=0.01;  

[xd, tsamp] = conv_cd(voz_expand,t,1/fs1); 

% Señal reconstruida en el tiempo
for k = 1:length(t)
    hi1 = filtro_ideal(t(k)-tsamp, Ts);
    xr4(k) = sum(xd.*hi1);
end
 
figure(3); 
hold on;
plot(tsamp,xr4,'b');%la señal reconstruida en verde. 
hold off;
 

 
 