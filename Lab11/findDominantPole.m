poles = [0.8625, 0.8354 + 0.1173i, 0.8354 - 0.1173i, 0.0656];
magnitudes = abs(poles);
[~, dominant_index] = max(magnitudes);
dominant_pole = poles(dominant_index);
disp('Pólo dominante:');
disp(dominant_pole);
disp('Módulo do pólo dominante:');
disp(abs(dominant_pole));
% Passo 1: Definir os pólos
poles = [0.8625, 0.8354 + 0.1173i, 0.8354 - 0.1173i, 0.0656];

% Passo 2: Calcular os módulos
magnitudes = abs(poles);

% Passo 3: Identificar o pólo com módulo mais próximo de 1
[~, dominant_index] = max(magnitudes);
dominant_pole = poles(dominant_index);

% Passo 4: Exibir os resultados
disp('Pólo dominante:');
disp(dominant_pole);
disp('Módulo do pólo dominante:');
disp(abs(dominant_pole));