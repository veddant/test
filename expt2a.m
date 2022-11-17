       %%  HUFFMAN CODING AND DECODING  %%   
clc;
clear all;
close all;
 
n  = input('Enter the number of symbol = ');
P  = input('Enter their probabilitie =');
sig = 1:length(P);
symbols = 1:length(P);
 
%% Dictionary formation

[dict, avglen] = huffmandict(symbols, P);
temp = dict;
for i = 1: length(temp)
     temp {i, 2} = num2str(temp{i, 2});
end
disp(temp);
 
%% Huffman encoder

X=input('enter the symbol');
Hcode = huffmanenco(X,dict);
Hcode
%% Huffman decoder

Decoder=huffmandeco(Hcode,dict);
Decoder
%% Computing entropy

h_x = 0;
for  i = 1:length(P)
h_x = h_x - P(i)*log2(P(i));
end
h_x

%% Avg codeword length

L=avglen;
L

%% Efficiency

efficiency = h_x/avglen;
efficiency
%% Redundancy

redundancy=1-efficiency;
redundancy
  