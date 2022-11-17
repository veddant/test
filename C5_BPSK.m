clc;
clear all;
close all;
nr_data_bits=8192;
b_data=(randn(1,nr_data_bits))>.5;
b=[b_data]; 
d=zeros(1,length(b));

for n=1:length(b)
    if(b(n)==0)
        d(n)=exp(j*2*pi);
    end        
    if(b(n)==1)
        d(n)=exp(j*pi);
    end   
end   
disp(d)
bpsk=d;
%%% Plotting of BPSK Data
figure(1);
plot(d,'o');
axis([-2 2 -2 2]);
grid on;
xlabel('real');
ylabel('imag');
title('BPSK constellation');

%% Addition of Noise

SNR=0:10;
BER1=[];
SNR1=[];
for SNR=0:length(SNR);
 sigma=sqrt(10.0^(-SNR/10.0));  
 snbpsk=(real(bpsk)+sigma.*randn(size(bpsk)))+i.*(imag(bpsk)+sigma*randn(size(bpsk))); 

%% Plotting of BPSK data with Noise
figure(2);
plot(snbpsk,'o');
axis([-2 2 -2 2]);
grid on;
xlabel('real');
ylabel('imag');
title('Bpsk constellation with noise');

%% Recovering Data
%receiver
r=snbpsk;
bhat=[real(r)<0];
bhat=bhat(:)';
bhat1=bhat;
ne=sum(b~=bhat1);
BER=ne/nr_data_bits;
BER1=[BER1 BER];
SNR1=[SNR1 SNR];
end

%%Plotting of BER graph of BPSK
figure(3);
semilogy(SNR1,BER1,'-*');
grid on;
xlabel('SNR=Eb/No(db)');
ylabel('BER');
title('Simulation of BER for BPSK ');
legend('BER-simulated');
