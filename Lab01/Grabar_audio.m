close all; clear; clc;
%% Parámetros de Captura
Fs = 10000; % Frecuencia de Muestreo
r = 16; % Número de bits/muestra
nc = 1; % Número de canales
tc = 4; % Tiempo de captura

%% Captura de Audio
recorder = audiorecorder(Fs, r, nc, 1); % Objeto para la grabación de audio

disp('Start speaking.')
recordblocking(recorder, tc); % Permite que se complete el audio sin un pause
disp('End of Recording.');

%% Almacenamiento en un vector y en el ordenador
x = getaudiodata(recorder, 'double'); % Almacenamos la data en el vector
audiowrite('senal.wav', x, Fs);