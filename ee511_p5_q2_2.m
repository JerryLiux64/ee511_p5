clear;
sum_a=[];state_1=[];state_2=[];
v=0:0.01:1;
for i=1:101
    [sum_a(i) state_1(i) state_2(i)]=ee511_p5_q2(v(i),0.75);
end
figure(1);
bar(state_1)
figure(2);
bar(state_2)
figure(3);
x=sum_a-state_1-state_2;
bar(x);
disp('Mean of the number of packets in buffer1:');
disp(sum(state_1)/10000);
disp('Mean of the number of packets in buffer2:');
disp(sum(state_2)/10000);
disp('Mean of the number of packets processed per time slot:');
disp(sum(sum_a-state_1-state_2)/10000/101);
disp('95% interval of efficiency:');
x=sort(x);
y=(x(3)+x(2))/2;
j=(x(97)+x(98))/2;
disp(y);disp(j);


