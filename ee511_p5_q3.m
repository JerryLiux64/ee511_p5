clc;clear;
initialstate=[zeros(1,95),1,1,1,zeros(1,100),1,1,1];

N=100;
P=zeros(2*N+1,2*N+1);
%-----Transition matrix-----
for i=1:2*N+1
    for j=1:2*N+1
        p(i,j)=nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
    end
end

g=10000;%number of maximum generations to be considered
output=zeros(g+1,2*N+1);
output(1,:)=initialstate;

for i=1:g
    disp(i);
    output(i+1,:)=output(i,:)*p;
    LIT = ismembertol(output(i+1,:),output(i,:));
    if all(LIT == 1)     
        break;
    end
end