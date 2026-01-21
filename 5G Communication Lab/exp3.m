% Parameters
numTx = 2; % Number of transmit antennas
numRx = 2; % Number of receive antennas


numSymbols = 1000; % Number of symbols to transmit
snr_dB = 20; % Signal-to-noise ratio (dB)

% Generate random data symbols
dataSymbols = randi([0 1], numSymbols, numTx);

% Modulation
modulatedSymbols = pskmod(dataSymbols, 2); % BPSK modulation

% MIMO Channel (Rayleigh fading)
H = 1/sqrt(2) * (randn(numRx, numTx) + 1i*randn(numRx, numTx));

% Add noise
snr_linear = 10^(snr_dB/10);
noisePower = 1/snr_linear;
noise = sqrt(noisePower/2) * (randn(numSymbols, numRx) + 1i*randn(numSymbols, numRx));
% Received signal
receivedSymbols = modulatedSymbols * H' + noise;
% ML (Maximum Likelihood) detection
detectedSymbols = pskdemod(receivedSymbols, 2);
% Calculate bit error rate (BER)
ber = sum(sum(dataSymbols ~= detectedSymbols)) / (numSymbols*numTx);
disp(['Bit Error Rate (BER): ' num2str(ber)]);