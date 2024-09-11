zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
G = tf(wn^2, [1 2*zeta*wn wn^2]); % Funcao de Transferencia
wb = bandwidth(G);
fb = wb/(2*pi);

Fc = 10000;    % Ferquencia de amostragem em Hz  
T = 15; % Tempo final da simula??o
F0 = 10*fb;    % Frequencia de amostragem in Hz
W0 = F0*2*pi;
T0 = 1/F0    % Periodo de amostragem em segundos

Gz = c2d(G, T0, 'zoh');
z = zero(Gz);
p = pole(Gz);

[num, den] = tfdata(G, 'v')


figure
plot(out.y_c.Time , out.y_c.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')
title('Saída contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Contínuo', 'Discreto')
grid on

figure
plot(out.e_c.Time , out.e_c.Data, 'b')
hold on
stairs(out.e_d.Time, out.e_d.Data, 'r')
title('Erro contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Contínuo', 'Discreto')
grid on

figure
plot(out.u_c.Time , out.u_c.Data, 'b')
hold on
stairs(out.u_d.Time, out.u_d.Data, 'r')
title('Disturbio contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Contínuo', 'Discreto')
grid on