%% a)
N = 100;
x = 1;
b = GenerateBits(N);
Matrix = RunningFrequencyComputation(b,x);
figure(1),
plot(Matrix)
title('Running Frequency of 1s Graphs')
ylabel('Running Frequency')
xlabel('Generated Vector')
%% b)
N = 100;
x = 0;
b = GenerateBits(N);
Matrix = RunningFrequencyComputation(b,x);
figure(2),
plot(Matrix)
title('Running Frequency of 0s Graphs')
ylabel('Running Frequency')
xlabel('Generated Vector')
%% c)
c = [0 1 0 1];
L_equal_1 = RepetitionEncoder(c,1)
L_equal_2 = RepetitionEncoder(c,2)
L_equal_3 = RepetitionEncoder(c,3)
L_equal_4 = RepetitionEncoder(c,4)
