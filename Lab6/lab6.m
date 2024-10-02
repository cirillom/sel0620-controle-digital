%% values
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
Kp = 1;

G = tf(wn^2, [1 2*zeta*wn wn^2]); % Funcao de Transferencia
wb = bandwidth(G);
fb = wb/(2*pi);

Fc = 10000; 
F0 = 10*fb;
W0 = F0*2*pi;
T0 = 1/F0

Gz = c2d(G, T0, 'zoh');
z = zero(Gz);
p = pole(Gz);

[num, den] = tfdata(G, 'v');
[Ac, Bc, Cc, Dc] = tf2ss(num, den); % Matrizes de estado do sistema contínuo

ss_c = ss(Ac, Bc, Cc, Dc);
ss_d = c2d(ss_c, T0);
F = ss_d.A;
H = ss_d.B;
Cd = ss_d.C;
Dd = ss_d.D;

%% simulink
model = 'ambasMalhas';
load_system(model);
set_param(model, 'StopTime', '30');
out = sim(model);
save_system(model);
close_system(model);

figure
plot(out.y_c.Time , out.y_c.Data, 'b')
hold on
stairs(out.y_d.Time, out.y_d.Data, 'r')
title('Saída contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Tensão (v)')
legend('Contínuo', 'Discreto')
grid on
saveas(gcf, "imagens/saida-planta1.png");

figure
plot(out.x_c.Time , out.x_c.Data, 'b')
hold on
stairs(out.x_d.Time, out.x_d.Data, 'r')
title('Espaço de estados contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Contínuo x1', 'Contínuo x2', 'Discreto x1', 'Discreto x2')
grid on
saveas(gcf, "imagens/estados-planta1.png");