clc;
clear;
close all;

% Parameters
num_symbols = 10000;      % Symbols per user
num_users = 5;            % Number of users
snr_range = 0:5:30;       % SNR range in dB

% Modulation (QPSK → M = 4)
M = 4;

channel_gain = 1;
noise_power = 1;

ber = zeros(length(snr_range), 1);

% Simulation
for i = 1:length(snr_range)
    
    snr_linear = 10^(snr_range(i)/10);
    noise_variance = 1/(2*snr_linear);
    
    total_errors = 0;
    total_bits = 0;
    
    for u = 1:num_users
        
        % Generate random bits
        data = randi([0 1], num_symbols, 1);
        
        % QPSK Modulation
        mod_symbols = qammod(data, M, 'gray', 'InputType', 'bit');
        
        % AWGN Noise
        noise = sqrt(noise_variance) * ...
            (randn(size(mod_symbols)) + 1i*randn(size(mod_symbols)));
        
        % Channel
        received = channel_gain * mod_symbols + noise;
        
        % Demodulation
        demod_data = qamdemod(received, M, 'gray', 'OutputType', 'bit');
        
        % Count errors
        total_errors = total_errors + sum(data ~= demod_data);
        total_bits = total_bits + length(data);
    end
    
    % BER
    ber(i) = total_errors / total_bits;
end

% Plot BER Curve
figure;
semilogy(snr_range, ber, 'b-o', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('5G Modulation Performance (QPSK, Multi-User AWGN)');
legend('Simulated BER');