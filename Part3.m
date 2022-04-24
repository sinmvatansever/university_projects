N = 1000;
b = GenerateInputSymbols(N, probVector);   %This function replaces the GenerateBits(N) function.

PA = RunningFrequencyComputation(b,'A');
PB = RunningFrequencyComputation(b,'B');
PC = RunningFrequencyComputation(b,'C');
PD = RunningFrequencyComputation(b,'D');
PE = RunningFrequencyComputation(b,'E');
figure(1),
plot(PA)
xlabel('Samples')
ylabel('P(A)')
figure(2),
plot(PB)
xlabel('Samples')
ylabel('P(B)')
figure(3),
plot(PC)
xlabel('Samples')
ylabel('P(C)')
figure(4),
plot(PD)
xlabel('Samples')
ylabel('P(D)')
figure(5),
plot(PE)
xlabel('Samples')
ylabel('P(E)')