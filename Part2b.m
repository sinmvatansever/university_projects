%% a)
L1 = 1;
y1 = [1];
d1 = MajorityDecoder(y1,L1)

L2 = 3;
y2 = [0 0 0 1 1 1 0 0 0];
y3 = [0 1 0 1 1 1 0 0 0];
y4 = [0 1 0 0 1 1 0 0 1];

d2 = MajorityDecoder(y2,L2)
d3 = MajorityDecoder(y3,L2)
d4 = MajorityDecoder(y4,L2)


%% Part2-c
N = 100;
L = 9;
b = GenerateBits(N);
c = Compression(b);
x = ChannelEncoder(c,L);
y = Channel(x) ;
d = ChannelDecoder(y,L);
b_hat = Decompression(d);
Matrix = RunningFrequencyComputation(b,b_hat);
figure(1),
plot(Matrix)
title('Bit Eror Rate Graph')
ylabel('Eror Value')
xlabel('Generated Vector')

%% Part 2-d)
ErrorofProbability = ErrorofProbability(3,0.1)


%% Part 2-e)
N = 1000;
L = 7;
b = GenerateBits(N);
c = Compression(b);
x = ChannelEncoder(c,L);
y = Channel(x) ;
d = ChannelDecoder(y,L);
b_hat = Decompression(d);
Matrix = RunningFrequencyComputation(b,b_hat);
figure(1),
plot(Matrix)
title('Bit Eror Rate Graph when E = 0.1 & L =7')
ylabel('Eror Value')
xlabel('Generated Vector')

