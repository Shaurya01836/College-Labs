waveconfig = struct;
waveconfig.NumSubframes = 10;
waveconfig.DisplayGrids = 1;
waveconfig.Windowing = [];

carrier = nrCarrierConfig;
carrier.SubcarrierSpacing = 15;
carrier.NSizeGrid = 52;

waveconfig.Carriers = {carrier};

prach = nrPRACHConfig;
prach.FrequencyRange = 'FR1';
prach.DuplexMode = 'FDD';
prach.ConfigurationIndex = 145;
prach.SubcarrierSpacing = 15;
prach.FrequencyIndex = 0;
prach.TimeIndex = 2;
prach.ActivePRACHSlot = 0;

waveconfig.PRACH = struct;
waveconfig.PRACH.Config = prach;
waveconfig.PRACH.AllocatedPreambles = 'all';
waveconfig.PRACH.Power = 0;

[waveform, gridset, winfo] = hNRPRACHWaveformGenerator(waveconfig);