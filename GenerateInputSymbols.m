function b = GenerateInputSymbols(N,probVector)
Objects    = {'A','B','C','D','E'};
idx = randp(probVector, 1, N); %https://uk.mathworks.com/matlabcentral/fileexchange/8891-randp
b = Objects(idx); %https://www.mathworks.com/matlabcentral/answers/373489-random-combinations-of-symbols-restored
end

