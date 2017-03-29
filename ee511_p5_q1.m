function [TB, j]=ee511_p5_q1
n=[];    %number of jobs in the server
lambda=20;  %lanbda(t)<=19;
Ts=0;   %time for waiting before next arrival
%Td=0;   service time = 60/exprnd(25)
Tb=0;   %break time
TB=0;   %total break time
s=[];    %state
s(2000)=0;
lambda_a=@(t) 4+3.*t; %?(t) of first 5 hours of the 10-hour-period
lambda_b=@(t) 19-3*(t-5);%?(t) of last 5 hours of the 10-hour-period
t=0;    %time line, starts from 0
j=1;
while(t<100) % for the first 100 hours
        U1=rand();
        t=t-log(U1)/lambda;
        U2=rand();
        if floor(mod(t,10))<=5
            if U2<=(lambda_a(mod(t,10))/lambda)
                %Ts=t;
                s(j)=t; %getting the estimated job arrival time
                j=j+1;
                %n=n+1;
                %break;
            end
        else
            if U2<=(lambda_b(mod(t,10))/lambda)
                %Ts=t;
                s(j)=t;
                j=j+1;
                %n=n+1;
                %break;
            end
        end
    %end
end
i=1;
T=s(i)+1/exprnd(25); %Job s + service time
n=0;    %number of jobs in system
while(T<100)
    if(T>=s(i+1)) %if there are jobs in the queue
        T=T+1/exprnd(25);
    else
        while(T<s(i+1)&&T<100) %no jobs in the queue
            Tb=rand()*0.3;
            T=T+Tb;
            TB=TB+Tb;
        end
        T=T+1/exprnd(25);
    end
    i=i+1; %i increments by 1 to ensure every job is served 
end
%disp('Estimated mean of break time for the first 100 hours:');
%disp(TB*60);disp('minutes')
        

