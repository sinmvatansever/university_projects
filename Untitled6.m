N = 15
L = 3
b= randi([0 1],1,N)
K = length(y);
M = K/L;
a = reshape(y,L,[])
b_hat = 0;

for i = 1:M
   b(i)= mode(a(:,i))
end




    