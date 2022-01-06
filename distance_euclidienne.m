function d=distance_euclidienne(XI,XJ)
len = size(XI);
sum = 0;
for i = 1:len(2)
    sum = sum+(XI(i)-XJ(i))^2;
end
d=sqrt(sum);
end