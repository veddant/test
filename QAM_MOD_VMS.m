clc;
clear all;
M=16;
x=[0:M-1];
N=1;
OFF=0;
z=pskmod(x,M);
figure(1)
scatterplot(z,N,OFF,"r+");


N=1;
OFF=0;
y=qammod(x,M);
figure(2)
scatterplot(y,N,OFF,"bo");

