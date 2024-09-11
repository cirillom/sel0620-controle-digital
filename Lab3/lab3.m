zeta = 1.012;
wn = 0.875;
R = 1.18;
g = tf(wn^2, [1 2*zeta*wn wn^2]) % Funcao de Transferencia
wb = bandwidth(g)
fb = wb/(2*pi)

Fc = 10000;    % Ferquencia de amostragem em Hz  
T = 15; % Tempo final da simula??o
F0 = 10*fb    % Frequencia de amostragem in Hz
W0 = F0*2*pi
T0 = 1/F0    % Periodo de amostragem em segundos

gz = c2d(g, T0, 'zoh')
z = zero(gz)
p = pole(gz)

[num, den] = tfdata(g, 'v')

step(R*g)       % Resposta contínua ao degrau com amplitude r
hold on
step(R*gz)      % Resposta discreta ao degrau com amplitude r

title('Resposta do sistema contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Contínuo', 'Discreto')
grid on

figure
plot(out.y_c.Time , out.y_c.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')
title('Resposta do Simulink contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Contínuo', 'Discreto')
grid on

