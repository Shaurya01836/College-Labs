% Parameters
carrierFreq = 3e9; % Carrier frequency in Hz (3 GHz)
numerologyIndex = 1; % Numerology index

% 5G NR subcarrier spacing configuration (kHz)
subcarrierSpacingConfig = [15, 30, 60, 120, 240];

% Calculate subcarrier spacing
if numerologyIndex >= 0 && numerologyIndex <= 3
    % Extended CP numerology
    subcarrierSpacing = subcarrierSpacingConfig(numerologyIndex + 1);
else
    % Normal CP numerology
    subcarrierSpacing = subcarrierSpacingConfig(numerologyIndex - 3);
end

% Display results
disp(['Numerology Index: ' num2str(numerologyIndex)]);
disp(['Subcarrier Spacing: ' num2str(subcarrierSpacing) ' kHz']);

% Convert to Hz
subcarrierSpacingHz = subcarrierSpacing * 1e3;

% Plot subcarrier spacing
figure;
stem(0:subcarrierSpacingHz:carrierFreq - subcarrierSpacingHz, ...
     'filled', 'LineWidth', 2);

xlabel('Frequency (Hz)');
ylabel('Subcarrier Index');
title(['5G NR Subcarrier Spacing for Numerology ' num2str(numerologyIndex)]);