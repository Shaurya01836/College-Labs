clc; clear; close all;

rng(61);

%% PARAMETERS
prm.numSTS = 16;
prm.numTx = 32;
prm.numRx = 16;

prm.fc = 4e9;
prm.cLight = physconst('LightSpeed');
prm.lambda = prm.cLight / prm.fc;

prm.NFig = 5;

% OFDM
prm.FFTLength = 256;
prm.CyclicPrefixLength = 64;
prm.numCarriers = 234;

%% ARRAY CONFIG (REPLACES helperArrayInfo)
isTxURA = true;
expFactorTx = prm.numTx / prm.numSTS;

%% GENERATE RANDOM TRANSMIT SIGNAL
numSamples = 1000;
txSig = complex(randn(numSamples, prm.numTx), randn(numSamples, prm.numTx));

%% SIMPLE CHANNEL (REPLACES helperApplyChannel)
H = (randn(prm.numRx, prm.numTx) + 1j*randn(prm.numRx, prm.numTx))/sqrt(2);

rxSig = txSig * H.';   % MIMO channel
chanDelay = 0;

%% ADD NOISE
snr = 20;
rxSig = awgn(rxSig, snr, 'measured');

%% SIMPLE CHANNEL ESTIMATION (REPLACES helperMIMOChannelEstimate)
hD = repmat(H, [1 1 prm.numCarriers]);

%% BEAMFORMING WEIGHTS (BUILT-IN)
v = diagbfweights(hD);

%% TRANSMITTER AMPLIFIER
amplifier = phased.Transmitter('PeakPower',1/prm.numTx,'Gain',0);

for n = 1:prm.numTx
    txSig(:,n) = amplifier(txSig(:,n));
end

%% ARRAY CREATION
if isTxURA
    arrayTx = phased.URA([expFactorTx prm.numSTS], ...
        [0.5 0.5]*prm.lambda, ...
        'Element',phased.IsotropicAntennaElement('BackBaffled',true));
else
    arrayTx = phased.ULA(prm.numTx, ...
        'ElementSpacing',0.5*prm.lambda, ...
        'Element',phased.IsotropicAntennaElement('BackBaffled',true));
end

%% STEERING
mobileAngle = [33; 0];
steeringAngle = [30; -20];

SteerVecTx = phased.SteeringVector( ...
    'SensorArray',arrayTx, ...
    'PropagationSpeed',prm.cLight);

wT = SteerVecTx(prm.fc, steeringAngle);

%% RADIATOR
radiatorTx = phased.Radiator( ...
    'Sensor',arrayTx, ...
    'WeightsInputPort',true, ...
    'PropagationSpeed',prm.cLight, ...
    'OperatingFrequency',prm.fc, ...
    'CombineRadiatedSignals',false);

txSteerSig = radiatorTx(txSig, ...
    repmat(mobileAngle,1,prm.numTx), ...
    conj(wT));

%% VISUALIZATION
figure;
viewArray(arrayTx);
title('Transmit Array Geometry');

figure;
pattern(arrayTx, prm.fc, ...
    'PropagationSpeed', prm.cLight, ...
    'Weights', wT);
title('Array Response Pattern');

figure;
patternAzimuth(arrayTx, prm.fc, ...
    'PropagationSpeed', prm.cLight, ...
    'Weights', wT);
title('Azimuth Pattern');

if isTxURA
    figure;
    patternElevation(arrayTx, prm.fc, ...
        'PropagationSpeed', prm.cLight, ...
        'Weights', wT);
    title('Elevation Pattern');
end
