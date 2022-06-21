close all; clear; clc;
%% Carga de la señal
[x, Fs] = audioread('senal.wav');

%% Obtención de valores Máximos y Mínimos
fprintf('Valor mínimo: %0.4f\n', min(x));
fprintf('Valor absoluto mínimo: %0.4f\n', min(abs(x)));
fprintf('Valor máximo: %0.4f\n', max(x));
fprintf('Valor absoluto máximo: %0.4f\n', max(abs(x)));

%% Cantidad de Muestras
tam = length(x);
fprintf('Cantidad de muestras: %i\n', tam);

%% Ploteo
tc = 4;
T = 1/Fs;
t = 0:T:tc - T;

plot(t, x);
grid on;
xlabel('Tiempo (s)');
ylabel('Amplitud');
title('Señal capturada');





