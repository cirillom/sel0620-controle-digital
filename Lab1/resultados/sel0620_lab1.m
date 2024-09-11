clear
close all

%%%%%%%%% Figura 1 %%%%%%%%%%%%

figure % Abre uma nova figura

% Plotar uma senoide
t = 0:0.01:15; % gerar um conjunto de pontos no tempo com intervalo de 0.01
T = 5; % periodo da onda
A = 3; % amplitude da onda
y = A*sin(2*pi*t/T); % função y(t)
plot(t,y,'b') % plota o grafico y(t) com cor azul

hold on; % Preserva o grafico anterior na figura para que os proximos sejam mostrados sobrepostos

% Simular um processo de amostragem com periodo de amostragem T0 = T/8
F = T/8;
t2 = 0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T/8$, inicio em $t=0$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);

saveas(gcf, "1", "png");

%%%%%%%%% Figura 2 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
% Simular um processo de amostragem com periodo de amostragem T0 = T
F = T;
T0 = 0;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T$, inicio em $t=0$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "2", "png");

%%%%%%%%% Figura 3 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
F = T;
T0 = T/8;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T$, inicio em $t=T/8$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "3", "png");

%%%%%%%%% Figura 4 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
F = T/2;
T0 = 0;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T/2$, inicio em $t=0$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "4", "png");

%%%%%%%%% Figura 5 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
F = T/2;
T0 = T/4;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T/2$, inicio em $t=T/4$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "5", "png");

%%%%%%%%% Figura 6 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
F = T/2;
T0 = T/8;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T/2$, inicio em $t=T/8$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "6", "png");

%%%%%%%%% Figura 7 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
F = (0.9*T)/2;
T0 = 0;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $(0.9T)/2$, inicio em $t=0$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "7", "png");

%%%%%%%%% Figura 8 %%%%%%%%%%%%

figure 
plot(t,y,'b') % plota o grafico y(t) com cor azul
hold on;

% CONTINUAR
F = T/4;
T0 = 0;
t2 = T0:F:15; % gerar um conjunto de pontos que começa no tempo em 0, termina em valor menor ou igual a 12, com espaçamento de T0 entre os pontos
y2 = A*sin(2*pi*t2/T); % funcao discreta 
stairs(t2,y2,'r'); % plota o grafico discreto no formato de escadas
grid; % adiciona grid na figura
title('Senoide, $y(t)=sin(2\pi f t)$, periodo de amostragem $T/4$, inicio em $t=0$','interpreter','latex','FontSize',12)
xlabel('$t$','interpreter','latex','FontSize',12)
ylabel('$y(t)$','interpreter','latex','FontSize',12)
axis([0, 12, -3.5,3.5]) % Mostra a figura com eixo x de 0 a 12, e eixo y de -2.5 a 2.5
legend(['continuo';'discreto']);
saveas(gcf, "8", "png");




