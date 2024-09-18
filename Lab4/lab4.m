%% values
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
Kp = 1;

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

[num, den] = tfdata(G, 'v');

%% simulink
model = 'ambasMalhas';
load_system(model);
set_param(model, 'StopTime', '30');
out = sim(model)
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
%saveas(gcf, "imagens/saida-planta1.png");

figure
plot(out.e_c.Time , out.e_c.Data, 'b')
hold on
stairs(out.e_d.Time, out.e_d.Data, 'r')
title('Erro contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Tensão (v)')
legend('Contínuo', 'Discreto')
grid on
%saveas(gcf, "imagens/erro-planta1.png");

figure
plot(out.u_c.Time , out.u_c.Data, 'b')
hold on
stairs(out.u_d.Time, out.u_d.Data, 'r')
title('Disturbio contínuo e discreto')
xlabel('Tempo (s)')
ylabel('Tensão (v)')
legend('Contínuo', 'Discreto')
grid on
%saveas(gcf, "imagens/disturbio-planta1.png");

%% locus
figure;
rlocus(G);
title('Lugar das raízes do sistema com controlador proporcional');
xlabel('Eixo real');
ylabel('Eixo imaginário');
%saveas(gcf, "imagens/rlocus-planta1.png")

%% bode
figure
bode(G)
margin(G)
title('Diagrama de bode com margem de ganho')
saveas(gcf, "imagens/bodeMargin-planta1.png")

%% malha fechada
Gmf = feedback(Kp*G, 1);
Gmfz = feedback(Kp*Gz , 1);

pgmf = pole(Gmf);
zgmf = zero(Gmf);
pgmfz = pole(Gmfz);
zgmfz = zero(Gmfz);

figure
step(R*Gmf)
hold on
step(R*Gmfz)
title('Saída sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (v)')
legend('Contínuo', 'Discreto')
grid on
saveas(gcf, "imagens/saida-malhafechada.png");
