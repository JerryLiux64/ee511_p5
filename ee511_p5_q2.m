function [sum, State_1, State_2]=ee511_p5_q2(p,r)
State_1=0; %number of packets in buffer 1
State_2=0; %number of packets in buffer 2
sum=0;     %total number of packets bufferred
flag_1=0;  %assgin destination for input 1
flag_2=0;  %assgin destination for input 2

for i=1:10000
    if rand()<p
        State_1=State_1+1;
        sum=sum+1;
    end
    
    if rand()<p
        State_2=State_2+1;
        sum=sum+1;
    end

    if State_1~=0&&flag_1==0%assign destination to new packet of input 1
        if rand()<r
            flag_1=1;
        else
            flag_1=2;
        end
    end
    if State_2~=0&&flag_2==0%assign destination to new packet of input 2
        if rand()<r
            flag_2=1;
        else
            flag_2=2;
        end
    end
    
    if flag_1==1 && flag_2==1 || flag_1==2 && flag_2==2 %conflict
        if rand()<0.5
            State_1=State_1-1;
            flag_1=0;
        else
            State_2=State_2-1;
            flag_2=0;
        end
    else if flag_1==1 && flag_2==2 || flag_1==2 && flag_2==1 %no conflict
            State_1=State_1-1;
            State_2=State_2-1;
            flag_1=0;flag_2=0;
    else if flag_1~=0 % imput 2 is empty
            State_1=State_1-1;
            flag_1=0;
    else if flag_2~=0 % imput 1 is empty
            State_2=State_2-1;
            flag_2=0;
         end
        end
        end
    end
end

            
        
        
            