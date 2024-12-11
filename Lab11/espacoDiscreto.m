%% values
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;

G = tf(wn^2, [1 2*zeta*wn wn^2]); % Funcao de Transferencia
%T0 = 1.1370;
T0 = 0.203;

Gz = c2d(G, T0, 'zoh');

[num, den] = tfdata(G, 'v');
[Ac, Bc, Cc, Dc] = tf2ss(num, den); % Matrizes de estado do sistema contínuo

ss_c = ss(Ac, Bc, Cc, Dc);
ss_d = c2d(ss_c, T0);

pole(ss_d)

F = ss_d.A;
H = ss_d.B;
Cd = ss_d.C;
Dd = ss_d.D;

K_ganhos = place(F,H,[0.8625,0.8325]);
sys = ss(F-H*K_ganhos, H, Cd, Dd, T0);


%% simulink
model = 'realimentacao_estados';
load_system(model);
set_param(model, 'StopTime', '30');
out = sim(model);
save_system(model);
close_system(model);

figure
hold on
stairs(out.x_d.Time, out.x_d.Data) % Com realimentacao
stairs(out.x_ds.Time, out.x_ds.Data) % Sem realimentacao
title(['Estados discretos no tempo'])
xlabel('Tempo (s)')
ylabel('Estado')
legend('Estado 1 Realimentado', 'Estado 2 Realimentado', 'Estado 1 Não Realimentado', 'Estado 2 Não Realimentado')
hold off

figure
hold on
stairs(out.u_d.Time, out.u_d.Data)
stairs(out.u_ds.Time, out.u_ds.Data)
title(['Entrada no tempo'])
xlabel('Tempo (s)')
ylabel('u(t)')
legend('Com realimentação', 'Sem realimentação')
hold off

figure
hold on
stairs(out.y_d.Time, out.y_d.Data)
stairs(out.y_ds.Time, out.y_ds.Data)
title(['Saída no tempo'])
xlabel('Tempo (s)')
ylabel('y(t)')
legend('Com realimentação', 'Sem realimentação')
hold off