%% values
%definicao de valores e parametros
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
tempo_disturbio = 15;
Kp = 1;

% zeta = 1.011; %HUGO
% wn = 1.045; %HUGO
% R = 1.25; %HUGO
% disturbio = 0.24; %HUGO
% Kp = 1; %HUGO

%funçao de transferencia
G = tf(wn^2, [1 2*zeta*wn wn^2]); % Funcao de Transferencia

[Gnum,Gden] = tfdata(G, 'v');

wb = bandwidth(G);
fb = wb/(2*pi);

%configuracao da discretizacao
Fc = 10000;    % Ferquencia de amostragem em Hz  
T = 15; % Tempo final da simula??o
F0 = 56*fb;    % Frequencia de amostragem in Hz
W0 = F0*2*pi;
T0 = 1/F0    % Periodo de amostragem em segundos
% T0 = 0.201; %HUGO

%discretizacao da funcao de transferencia
Gz = c2d(G, T0, 'zoh');

%% malha fechada
%Kp = 1;
Gmf = feedback(Kp*G, 1);
Gmfz = feedback(Kp*Gz , 1);

%% tempo de subida e descida
info = stepinfo(Gz);
% Exibir o tempo de subida e tempo de acomodação
fprintf("\n Kp = %d:\n", Kp)
fprintf('Tempo de subida: %.4f segundos\n', info.RiseTime);
fprintf('Tempo de acomodação (2%%): %.4f segundos\n', info.SettlingTime);
fprintf('Tempo de Pico: %.4f segundos\n', info.PeakTime);

% inicio relatorio 
% clear all;
% clc;
%rltool;

%% Controlador
%Ts = 0.203;  % Tempo de amostragem
numerator_C = [5.1923 -8.2329 3.2392];
denominator_C = [1 -1 0];  % Polo em z = 1

Gc = tf(numerator_C, denominator_C, T0);  % Função de transferência do controlador

Gcmfz = feedback(Gc*Gz, 1);

[Gcmfznum,Gcmfzden] = tfdata(Gcmfz, 'v');

z = zero(Gcmfz);
fprintf("Zeros: ");
disp(z.');
p = pole(Gcmfz);
fprintf("Polos: ");
disp(p.');



%%simulink

model = 'pidsimulink';
load_system(model);
set_param(model, 'StopTime', '30');
out = sim(model)
save_system(model);
close_system(model);

figure
stairs(out.Plant.Time , out.Plant.Data, 'b')
hold on
stairs(out.Plant2.Time , out.Plant2.Data, 'r')
title('Planta do sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
legend('Controlador PID', 'Controlador P')
grid on

figure
stairs(out.saidaPID.Time , out.saidaPID.Data, 'b')
hold on
stairs(out.saidaP.Time , out.saidaP.Data, 'r')
title('Resposta do sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
legend('Controlador PID', 'Controlador P')
grid on

figure
stairs(out.erroPID.Time , out.erroPID.Data, 'b')
hold on
stairs(out.erroP.Time , out.erroP.Data, 'r')
title('Erro do sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
legend('Controlador PID', 'Controlador P')
grid on

%% QUESTÃO 10
% Gzp = feedback(Gz, 1);
% Gzpid = feedback(Gc*Gz, 1);

% figure
% step(R*Gzpid, 'b');
% hold on;
% step(R*Gzp, 'r');
% title('Saída dos controladores sem distúrbio')
% xlabel('Tempo')
% ylabel('Tensão (V)')
% legend({'Controlador PID', 'Controlador P'}, 'Location', 'southeast');
% axis([0 30 0 1.4]);


% % Medir os parâmetros de desempenho para o controlador PID
% info_PID = stepinfo(out.saidaPID.Data, out.saidaPID.Time, 'RiseTimeLimits', [0.1 0.9]);

% % Medir os parâmetros de desempenho para o controlador proporcional
% info_P = stepinfo(out.saidaP.Data, out.saidaP.Time, 'RiseTimeLimits', [0.1 0.9]);

% % Exibir os resultados no console
% fprintf('Controlador PID:\n');
% fprintf('  Tempo de Acomodação (t_s): %.4f s\n', info_PID.SettlingTime);
% fprintf('  Tempo de Subida (t_r): %.4f s\n', info_PID.RiseTime);
% fprintf('  Tempo de Pico (t_p): %.4f s\n', info_PID.PeakTime);
% fprintf('  Sobressinal (M_p): %.2f %%\n', info_PID.Overshoot);

% fprintf('\nControlador P:\n');
% fprintf('  Tempo de Acomodação (t_s): %.4f s\n', info_P.SettlingTime);
% fprintf('  Tempo de Subida (t_r): %.4f s\n', info_P.RiseTime);
% fprintf('  Tempo de Pico (t_p): %.4f s\n', info_P.PeakTime);
% fprintf('  Sobressinal (M_p): %.2f %%\n', info_P.Overshoot);
