clc;
clear;
close all;

%% ================= INITIALIZATION =================
rng(67);

prm.fc = 28e9;
prm.chanSRate = 100e6;
prm.ChanType = 'Scattering';
prm.NFig = 8;
prm.nRays = 500;

prm.bitsPerSubCarrier = 4; % 16-QAM
prm.numDataSymbols = 10;

prm.numSTSVec = [4 3 2 4 3];
prm.numSTS = sum(prm.numSTSVec);
prm.numTx = prm.numSTS * 8;

prm.groups = [1 1 1 2 2];
prm.numSTSVecAll = prm.numSTSVec;
prm.numUsers = length(prm.numSTSVec);
prm.numGroups = max(prm.groups);

numGroups = prm.numGroups;

if strcmp(prm.ChanType,'Scattering')
    for g = 1:numGroups
        prm.groups(prm.numUsers+g) = g;
        prm.numSTSVecAll(prm.numUsers+g) = 2;
    end
end

%% ================= USER POSITION =================
maxRange = 700;
groupRanges = randi([1 maxRange],1,numGroups);

groupAzimuth = -60 + 60/(numGroups+1) + ...
    (120-(120/(numGroups+1)))/(numGroups-1) * (0:numGroups-1);

groupElevations = randi([-10 10],1,numGroups);

prm.numConnectedUsers = length(prm.numSTSVecAll);

prm.mobileRanges = zeros(prm.numConnectedUsers,1);
prm.mobileAngles = zeros(2,prm.numConnectedUsers);

for uIdx = 1:prm.numConnectedUsers
    g = prm.groups(uIdx);
    prm.mobileRanges(uIdx) = groupRanges(g) + 30*rand(1);
    prm.mobileAngles(:,uIdx) = ...
        [groupAzimuth(g)+3*rand(1); groupElevations(g)+3*rand(1)];
end

%% ================= CHANNEL MODEL =================
numSTS = prm.numSTS;
numTx = prm.numTx;

H = (randn(numSTS,numTx) + 1i*randn(numSTS,numTx))/sqrt(2);

%% ================= HYBRID BEAMFORMING =================
numRF = numSTS;

% Analog Beamformer
Frf = exp(1i*2*pi*rand(numTx,numRF));
Frf = Frf / sqrt(numTx);

% Effective Channel
Heff = H * Frf;

% Digital Beamformer (Zero Forcing)
Fbb = pinv(Heff);

% Total Precoder
F = Frf * Fbb;
F = F / norm(F,'fro');

%% ================= TRANSMISSION =================
M = 16; % 16-QAM
data = randi([0 M-1], numSTS, 1);

txSymbols = qammod(data, M, 'UnitAveragePower', true);

x = F * txSymbols;

%% ================= CHANNEL + NOISE =================
SNR = 20;
y = H * x;
y_noisy = awgn(y, SNR, 'measured');

%% ================= RECEIVER =================
rxSymbols = qamdemod(y_noisy, M, 'UnitAveragePower', true);

[numErrors, BER] = biterr(data, rxSymbols);

%% ================= OUTPUT DISPLAY =================
disp('===== 5G HYBRID BEAMFORMING SIMULATION =====');
disp(['Carrier Frequency: ', num2str(prm.fc/1e9), ' GHz']);
disp(['Total Users: ', num2str(prm.numUsers)]);
disp(['Total Streams: ', num2str(prm.numSTS)]);
disp(['Transmit Antennas: ', num2str(prm.numTx)]);
disp(['SNR (dB): ', num2str(SNR)]);
disp(['Bit Error Rate (BER): ', num2str(BER)]);

%% ================= PLOTS =================

% User Distribution Plot
figure;
polarplot(deg2rad(prm.mobileAngles(1,:)), prm.mobileRanges,'o');
title('User Locations (Polar Plot)');
grid on;

% Constellation Plot
figure;
scatterplot(y_noisy);
title('Received Signal Constellation (16-QAM)');
grid on;