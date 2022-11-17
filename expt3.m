%--------------------------------------------------------------------------
%Implementation of algorithms for generating and decoding Linear Block Code
%--------------------------------------------------------------------------
clc;
clear all;
n=input('enter the length of code words(n)=');
k=input('enter the length of data words(k)=');
p=input('enter the parity bit matrix of k*n-k=');
msg=input('enter the Message vector=');
G=[eye(k) p]
H=[p' eye(n-k)]
code = encode(msg,n,k,'linear',G)
trt = syndtable(H) % Produce decoding table.
recd =input('Enter the received codeword='); 
syndrome = rem(recd * H',2)
syndrome_de = bi2de(syndrome,'left-msb'); % Convert to decimal.
  if (syndrome==0)
      disp('The received codeword is correct')
      msg=recd(1:k)
  else
      disp('The received codeword is incorrect')
        errorpattern = trt(1+syndrome_de,:) 
        correctedcode = rem(errorpattern+recd,2)
        msg=correctedcode(1:k)
  end;