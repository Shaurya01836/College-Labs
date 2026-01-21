waveconfig = nrDLCarrierConfig;
[waveform, waveformInfo] = nrWaveformGenerator(waveconfig);

% Plot spectrogram of waveform for first antenna port
samplerate = waveformInfo.ResourceGrids.Info.SampleRate;
nfft = waveformInfo.ResourceGrids.Info.Nfft;

figure;
spectrogram(waveform(:,1), ones(nfft,1), 0, nfft, 'centered', samplerate, ...
            'yaxis', 'MinThreshold', -130);
title('Spectrogram of 5G Downlink Baseband Waveform');

waveconfig.PDSCH{1}.PRBSet = 0:10;
[waveform, waveformInfo] = nrWaveformGenerator(waveconfig);

% Plot spectrogram of waveform for first antenna port
samplerate = waveformInfo.ResourceGrids.Info.SampleRate;
nfft = waveformInfo.ResourceGrids.Info.Nfft;

figure;
spectrogram(waveform(:,1), ones(nfft,1), 0, nfft, 'centered', samplerate, ...
            'yaxis', 'MinThreshold', -130);
title('Spectrogram of 5G Downlink Baseband Waveform');