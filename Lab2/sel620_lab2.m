clear all
close all

% TODO: Alterar os valores para o seu caso
zeta = 1.012
wn = 0.875
R = 1.18
g = tf(wn^2, [1 2*zeta*wn wn^2]); % Funcao de Transferencia

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grafico de Bode
figure
bode(g)  
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Largura de Banda
% TODO: Colocar abaixo o valor de largura de banda para o seu caso. Usar o
% comando bandwidth ou encontrar pelo grafico de bode
wb =    bandwidth(g)
fb =    wb/(2*pi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau continua
Fc = 10000;    % Ferquencia de amostragem em Hz  
T = 15; % Tempo final da simula??o
t = 0:1/Fc:T; 
y = R*step(g,t);  % Resposta degrau unitario
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 1*fb %%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema para 1*fb')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 1*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
saveas(gcf, "degrau-1.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua
saveas(gcf, "fourier-1.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Para 2*fb %%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema para 2*fb')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 2*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
saveas(gcf, "degrau-2.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua
saveas(gcf, "fourier-2.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Para 5*fb %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema para 5*fb')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 5*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
saveas(gcf, "degrau-5.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua
saveas(gcf, "fourier-5.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Para 10*fb %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema para 10*fb')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 10*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
saveas(gcf, "degrau-10.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua
saveas(gcf, "fourier-10.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Para 35*fb %%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotar a resposta degrau unitario contínua
figure
plot(t,y)
title('Resposta degrau do sistema para 35*fb')
xlabel('Tempo (t)')
ylabel('y(t)')
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resposta degrau discreta
hold on
F0 = 35*fb;    % Frequencia de amostragem in Hz    
T0 = 1/F0;    % Periodo de amostragem em segundos
t2 = 0:T0:T; % Time vector 
y2 = R*step(g,t2);  % Step response
stairs(t2,y2,'r')
saveas(gcf, "degrau-35.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analise de Fourier
w0=F0*2*pi; % frequencia de amostragem do sinal discreto em rad/s
plot_fft_discreto(t,y,2*w0)  % t,y sao o vetor de tempo e sa?da da resposta degrau continua
saveas(gcf, "fourier-35.png");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%