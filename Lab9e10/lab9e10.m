%definicao de valores e parametros
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
tempo_disturbio = 15;
T0 = 0.01;

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

[NumGdb,DenGdb] = tfdata(Gdb, 'v');


%discretizacao da funcao de transferencia para 1.33*T0


%calculo dos coeficientes do controlador deadbeat para 1.33*T0
Gz2 = c2d(G, 1.33*T0, 'zoh');
[b2,a2] = tfdata(Gz2, 'v');
q02 = 1/(sum(b2));
q2 = a2*q02;
p2 = b2*q02;
Gdb2 = tf(q2,1-(p2),1.33*T0);
[NumGdb2,DenGdb2] = tfdata(Gdb2, 'v');

%Acha a funcao de transferencia de malha fechada 
%usando a funcao de malha aberta para T0
Gdbm = feedback(Gdb,1);

%Acha a funcao de transferencia de malha fechada
%usando a funcao de malha aberta para 1.33*T0
Gdbm2 = feedback(Gdb2,1); 

% Mostra os polos do sistema de malha fechada para T0
poles_Gdbm = pole(Gdbm);
disp('Poles of the closed-loop system:');
disp(poles_Gdbm);

% Mostra os polos do sistema de malha fechada para 1,33*T0
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
stairs(out.controle.Time , out.controle.Data, 'b')
title('Planta do sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
grid on

figure
stairs(out.saida.Time , out.saida.Data, 'b')
title('Resposta do sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
grid on

figure
stairs(out.erro.Time , out.erro.Data, 'b')
title('Erro do sistema de malha fechada')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
grid on




