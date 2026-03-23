clear
N = 10;

% Transmitter
ip = [0 1 0 1 0 1 0 1 0 1];
s = 2*ip - 1;

% Noise
n = 1/sqrt(2)*(randn(1,N) + 1j*randn(1,N));

Eb_N0_dB = -3:10;

for ii = 1:length(Eb_N0_dB)
   y = s + 10^(-Eb_N0_dB(ii)/20)*n;
   ipHat = real(y) > 0;
   nErr(ii) = sum(ip ~= ipHat);
end

simBer = nErr/N;
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10)));

% Plot
figure
semilogy(Eb_N0_dB,theoryBer,'b.-');
hold on
semilogy(Eb_N0_dB,simBer,'mx-');
grid on
legend('theory', 'simulation');
xlabel('Eb/No (dB)');
ylabel('BER');
title('BPSK BER Curve');