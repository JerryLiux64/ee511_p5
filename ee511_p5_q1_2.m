clc; clear;
TB=[];
j=[];
for i=1:10000
    [TB(i), j(i)]=ee511_p5_q1;
end
sum(TB)*60/10000
sum(j)/10000