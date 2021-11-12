
% -------------------------------------------------
%                   Ejercicio 3
% -------------------------------------------------

[voz_original,fs] = audioread('speech.wav');
sound(voz_original,fs);
t = linspace(0,4,length(voz_original));
plot(t,voz_original);
voz_expand = zeros(1,2*length(voz_original));
voz_expand(1:2:end) = voz_original;
sound(voz_expand,11025);