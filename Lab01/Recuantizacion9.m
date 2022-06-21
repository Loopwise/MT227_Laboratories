close all; clear; clc;
%% Carga de la señal
[x, Fs] = audioread('senal.wav');

%% Recuantización
rp = 9;
vmax = 2^(rp - 1);
fe = 1; % Factor de Escala -> 1 para double
yp = round(x*(vmax - 1)/fe); % Vector de Enteros
y = yp*fe/(vmax - 1); % Vector reproducible [-1, 1]
e = y - x; % Ruido de Recuantización

Ee = sum(e.*e) + 1e-20;% Varianza de la Señal de Entrada
Ex = sum(x.*x);% Varianza del Ruido de Recuantización
SNR = 10*log10(Ex/Ee); % Relación Señal/Ruido

fprintf('El factor de Escala es: %i\n', fe);
fprintf('La varianza de la Señal de Entrada (Ex): %.3f\n', Ex);
fprintf('La varianza del Ruido de Recuantización (Ee): %.3f\n', Ee);
fprintf('El valor de la SNR es: %.3fdB\n', SNR);

%% Calculando Intervalos de Cuantización
yp_max = 2^(rp-1) - 1;
yp_min = -yp_max;
yp_L = 2^rp - 1;
ICyp = (yp_max - yp_min)/(yp_L - 1); % Por la teoría debe ser 1
fprintf('El intervalo de cuantización del vector de enteros es: %i\n', ICyp);

y_max = 1;
y_min = -1;
y_L = 2^rp - 1;
ICy = (y_max - y_min)/(y_L - 1);
fprintf('El intervalo de cuantización del vector de enteros es: %0.3f\n', ICy);

%% Factor de Carga
x_max = 1; % Valor máximo de la señal de entrada -> Es 1 para doubles en Matlab
mean_x = mean(x); % Media para el cálculo de la varianza
var_x = sum(x.*x) - mean_x^2; % Varianza de la señal de entrada
sigma_x = sqrt(var_x); % Desviación estándar de la señal de entrada

gamma = x_max/sigma_x; % Factor de Carga
SNR_gamma = 6*rp + 10*log10(3/gamma^2); % SNR usando el Factor de Carga

fprintf('El factor de carga es: %.3f\n', gamma);
fprintf('El valor de la SNR es: %.3fdB\n', SNR_gamma);
