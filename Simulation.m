function [] = Simulation()%This is the main function
L = 3;
N = 10;
probVector = [0.4   0.05    0.2    0.15    0.2];
symbol = [{'A','B','C','D','E'}];
dict = huffmandict(symbol,probVector);

b = ['A' 'A' 'B' 'E' 'C' 'A' 'D']   %This function replaces the GenerateBits(N) function.
c = Compression(b, dict)
% x = ChannelEncoder(c, L);
% y = Channel(x);
% d = ChannelDecoder(y, L);
b_hat = Decompression(c, dict)



end

