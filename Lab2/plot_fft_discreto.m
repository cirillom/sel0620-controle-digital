function plot_fft_discreto(t,y,w0)
    % Transformada de Fourier
    L = length(t);      % Tamanho do sinal
    %n = 2^nextpow2(L);
    Y = fft(y);
    Ts = t(2)-t(1);
    Fs=1/Ts;
    % Valor absoluto normalizado
    P2 = abs(Y);
    P2 = P2/max(P2);
    % Pega somente o primeiro lado da transformada de Fourier 
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);  
    %P2s=P1;
    P2s = [P1(end:-1:2);  P1]'; % Monta um vetor com os dois lados da transformada de Fourier 

    % Vetor com frequencias em Hz 
    %fr2_hz = Fs*(0:(L/2))/L;
    fr2_hz = Fs*((-L/2+0.5):(L/2-0.5))/L;
    % Converte para rad/s
    fr2_rad = 2*pi*fr2_hz;

    % Plota o gr?fico
    figure; % Cria uma nova figura
    hold on
    plot(fr2_rad,P2s)
    plot(fr2_rad+w0,P2s,'r')
    plot(fr2_rad-w0,P2s,'g')
    y_filtro = [0, 0, 1, 1, 0, 0];
    w_filtro = [-w0, -w0/2, -w0/2, w0/2, w0/2, +w0];
    plot(w_filtro,y_filtro,'k')
    title('Amplitude Spectrum of Y(t)')
    xlabel('f (rad/s)')
    ylabel('|P(f)|')
    axis([-1.5*w0,1.5*w0,0,1.1]);
    grid;

end
