%definicao de valores e parametros
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
tempo_disturbio = 15;
T0 = 0.51;

%funçao de transferencia
G = tf(wn^2, [1 2*zeta*wn wn^2]);

[numPlanta,denPlanta] = tfdata(G, 'v');

%discretizacao da funcao de transferencia para T0
Gz = c2d(G, T0, 'zoh');

%calculo dos coeficientes do controlador deadbeat
[b,a] = tfdata(Gz, 'v');
b = b(2:end);

q0 = 1/(sum(b));
q = a*q0;
p = b*q0;
den_dead = [1,-p];
Gdb = tf(q,den_dead,T0);

%Acha a funcao de transferencia de malha fechada 
%usando a funcao de malha aberta para T0
Gdbm = feedback(Gdb*Gz,1); 

% Mostra os polos do sistema de malha fechada
poles_Gdbm = pole(Gdbm);
disp('Poles of the closed-loop system:');
disp(poles_Gdbm);

%%simulink
model = 'deadbeatsimulink';
load_system(model);
set_param(model, 'StopTime', '30');
out = sim(model);
save_system(model);
close_system(model);

figure
stairs(out.controle.Time , out.controle.Data, 'r')
title('Ação de controle do sistema de malha fechada para T0 = 0,51')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
grid on

figure
stairs(out.saida.Time , out.saida.Data, 'r')
title('Resposta do sistema de malha fechada para T0 = 0,51')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
grid on

figure
stairs(out.erro.Time , out.erro.Data, 'r')
title('Erro do sistema de malha fechada para T0 = 0,51')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
grid on

info = stepinfo(out.saida.Data, out.saida.Time);

fprintf('  Tempo de Acomodação (t_s): %.4f s\n', info.SettlingTime);

fprintf('  Tempo de Subida (t_r): %.4f s\n', info.RiseTime);

fprintf('  Tempo de Pico (t_p): %.4f s\n', info.PeakTime);

fprintf('  Sobressinal (M_p): %.2f %%\n', info.Overshoot);




