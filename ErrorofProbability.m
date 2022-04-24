function out = ErrorofProbability(L,p)
k = (L+1)/2;
sum = 0;

for i = k:L
    P_e(i) = nchoosek(L,i)*p^i*(1-p)^(L-i); %https://ch.mathworks.com/help/matlab/ref/nchoosek.html
    sum = sum + P_e(i);
end

out = sum;

end