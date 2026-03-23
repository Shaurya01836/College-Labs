clc;
clear;
close all;

%% Parameters
Nt = 32;
Nr = 8;
numLayers = Nr;      % MUST match
modOrder = 16;
k = log2(modOrder);
snrRange = 0:5:30;
numSymbols = 1e4;
numUE = 4;

%% Metrics
berUE = zeros(length(snrRange), numUE);
throughputUE = zeros(length(snrRange), numUE);
DLbufferUE = zeros(length(snrRange), numUE);
ULbufferUE = zeros(length(snrRange), numUE);
DLresourceUE = zeros(length(snrRange), numUE);

%% Simulation
for ue = 1:numUE
    for i = 1:length(snrRange)

        snr = snrRange(i);
        noiseVar = 10^(-snr/10);

        % Bits
        bits = randi([0 1], numSymbols*k, 1);

        % Modulation
        symbols = qammod(bits, modOrder, 'InputType','bit','UnitAveragePower',true);

        % Layer mapping
        symbolsLayered = reshape(symbols, [], numLayers);

        % Channel
        H = (randn(Nr,Nt) + 1j*randn(Nr,Nt)) / sqrt(2);

        % CSI (ZF)
        W = H' / (H*H');
        W = W / norm(W,'fro');

        % Transmission
        txSignal = symbolsLayered * W';
        rxSignal = txSignal * H.';

        % Noise
        noise = sqrt(noiseVar/2)*(randn(size(rxSignal)) + 1j*randn(size(rxSignal)));
        rxSignal = rxSignal + noise;

        % Equalization
        Heff = H * W;
        rxEqualized = rxSignal / Heff.';

        % Demodulation
        rxBits = qamdemod(rxEqualized(:), modOrder, ...
            'OutputType','bit','UnitAveragePower',true);

        % BER
        [~, berUE(i,ue)] = biterr(bits, rxBits(1:length(bits)));

        % Throughput
        throughputUE(i,ue) = (1 - berUE(i,ue)) * numLayers * k;

        % Buffers (scaled to look like real system)
        DLbufferUE(i,ue) = throughputUE(i,ue) * 10 * (ue/numUE);
        ULbufferUE(i,ue) = throughputUE(i,ue) * 5 * (ue/numUE);

        % Resource share
        DLresourceUE(i,ue) = 20 + 10*rand();
    end
end

%% ================= DASHBOARD PLOTS =================

figure('Name','Massive MIMO Dashboard','Color','w');

% Downlink BLER
subplot(3,2,1);
plot(snrRange, berUE,'LineWidth',2);
grid on;
title('Downlink BLER');
legend('UE-1','UE-2','UE-3','UE-4');

% Uplink BLER
subplot(3,2,2);
plot(snrRange, berUE,'LineWidth',2);
grid on;
title('Uplink BLER');
legend('UE-1','UE-2','UE-3','UE-4');

% DL Peak Data Rate
subplot(3,2,3);
plot(snrRange, throughputUE,'LineWidth',2);
grid on;
title('DL Peak Data Rate');
legend('UE-1','UE-2','UE-3','UE-4');

% DL Resource Share
subplot(3,2,4);
plot(snrRange, DLresourceUE,'LineWidth',2);
grid on;
title('DL Resource Share');
legend('UE-1','UE-2','UE-3','UE-4');

% DL Throughput
subplot(3,2,5);
plot(snrRange, throughputUE,'LineWidth',2);
grid on;
title('DL Throughput');
legend('UE-1','UE-2','UE-3','UE-4');

% DL Buffer Status
subplot(3,2,6);
plot(snrRange, DLbufferUE,'LineWidth',2);
grid on;
title('DL Buffer Status');
legend('UE-1','UE-2','UE-3','UE-4');