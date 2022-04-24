function [computation] = RunningFrequencyComputation(b,x)

computation = zeros(1,length(b));
sum = 0;
for i=1:length(b)
    if isequal(b{i},x)
        sum = sum + 1;
    end

    computation(i) = sum / i;


end

