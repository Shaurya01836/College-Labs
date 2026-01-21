clc; clear; close all;

%% Carrier Configuration
carrier = nrCarrierConfig;
carrier.NCellID = 1;
carrier.SubcarrierSpacing = 15;     
carrier.NSizeGrid = 52;             
carrier.NStartGrid = 0;
carrier.CyclicPrefix = 'Normal';

%% PDSCH Configuration
pdsch = nrPDSCHConfig;
pdsch.Modulation = 'QPSK';
pdsch.NumLayers = 1;               
pdsch.PRBSet = 0:carrier.NSizeGrid-1;
pdsch.SymbolAllocation = [0 14];
pdsch.MappingType = 'A';

%% Generate Resource Grid
resourceGrid = nrResourceGrid(carrier, pdsch.NumLayers);

%% Generate correct number of bits
pdschIndices = nrPDSCHIndices(carrier, pdsch);       % linear indices
numRE = numel(pdschIndices);                         % total REs
numBits = numRE * log2(4);                           % QPSK → 2 bits per RE
bits = randi([0 1], numBits, 1);

%% Generate PDSCH symbols
pdschSymbols = nrPDSCH(carrier, pdsch, bits);

%% Map PDSCH symbols into grid
resourceGrid(pdschIndices) = pdschSymbols;

%% OFDM Modulation
txWaveform = nrOFDMModulate(carrier, resourceGrid);

%% Time-Domain Waveform
figure;
plot(real(txWaveform));
title('5G NR Time Domain Waveform');
xlabel('Samples');
ylabel('Amplitude');
grid on;

%% Frequency Spectrum Plot
fs = carrier.SubcarrierSpacing*1e3*12*carrier.NSizeGrid; 
figure;
pwelch(txWaveform,[],[],[],fs,'centered');
title('5G NR Waveform Spectrum');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');

%% Resource Grid Visualization
figure;
imagesc(abs(resourceGrid(:,:,1)));
xlabel('OFDM Symbols');
ylabel('Subcarriers');
title('5G NR Resource Grid (Magnitude)');
colorbar;