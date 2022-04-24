function d=MajorityDecoder(y,L)
a = reshape(y,L,[]);
m = 0;
for i = 1:length(y)/L
    m(i) = mode(a(:,i));
end
d = m;

end