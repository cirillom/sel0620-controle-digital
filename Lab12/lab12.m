%definicao de valores e parametros
zeta = 1.012;
wn = 0.875;
R = 1.18;
disturbio = 0.24;
tempo_disturbio = 15;
T0 = 0.203;
sistema_inicial = [-0.11; -0.11];
observador_inicial = [0; 0]; 

%funçao de transferencia
G = tf(wn^2, [1 2*zeta*wn wn^2]);

[num, den] = tfdata(G, 'v');

[Ac ,Bc , Cc , Dc] = tf2ss(num, den)
ss_c = ss(Ac, Bc, Cc, Dc);
ss_d = c2d(ss_c, T0)

F = ss_d.A;
H = ss_d.B;
Cd = ss_d.C;
Dd = ss_d.D;
Lt = place(F', Cd', [0 1e-6]);
L = Lt'

sys  = ss(F-L*Cd, H, Cd, Dd, T0); % Test if things are working as it should
pole(sys)
