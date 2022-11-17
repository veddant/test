clc;
clear all;
type=input('enter the type of channels');
switch type
    case 'NFC'
m=input('enter the no of messages=');
n=m;
for i=1:m
    for j=1:n
        p(i,j)=input('enter the joint probabilities');
    end
end
p
for i=1:m
    pX(i)=sum(p(i,:));
end
pX
for j=1:n
    pY(j)=sum(p(:,j));
end
pY
HX=sum(-pX.*log2(pX))
HY=sum(-pY.*log2(pY))
HXY=HX
HXbyY=HXY-HY
HYbyX=HXY-HX
IXY=HX+HY-HXY
C=log2(m)
    case'EFC'
       m=input('enter the no of messages=');
n=3*m;
for i=1:m
    for j=1:n
        p(i,j)=input('enter the joint probabilities');
    end
end
p
for i=1:m
    pX(i)=sum(p(i,:));
end
pX
for j=1:n
    pY(j)=sum(p(:,j));
end
pY
HX=sum(-pX.*log2(pX))
HY=sum(-pY.*log2(pY))
HXY=HY
HXbyY=HXY-HY
HYbyX=HXY-HX
IXY=HX+HY-HXY
C=log2(m)
case 'NC'
m=input('enter the no of messages=');
n=m;
for i=1:m
    for j=1:n
        p(i,j)=input('enter the joint probabilities');
    end
end
p
for i=1:m
    pX(i)=sum(p(i,:));
end
pX
for j=1:n
    pY(j)=sum(p(:,j));
end
pY
HX=sum(-pX.*log2(pX))
HY=sum(-pY.*log2(pY))
h=sum(-p.*log2(p));
HXY=sum(h)
HXbyY=HXY-HY
HYbyX=HXY-HX
IXY=HX+HY-HXY
C=max(IXY)
case 'BSC'
m=input('enter the no of input messages=');
n=input('enter the no of output messages=');
for i=1:m
    for j=1:n
        pYbyX(i,j)=input('enter the conditional probabilities');
    end
end
pYbyX
for i=1:m
    pX(i)=input('enter the input probabilities');
end
pX
for i=1:m
    for j=1:n
        pXY(i,j)=pYbyX(i,j)*pX(i);
    end
end
pXY
for j=1:n
    pY(j)=sum(pXY(:,j));
end
pY
HX=sum(-pX.*log2(pX))
HY=sum(-pY.*log2(pY))
h=sum(-pXY.*log2(pXY));
HXY=sum(h)
HXbyY=HXY-HY
HYbyX=HXY-HX
IXY=HX+HY-HXY
C=log2(2)+pYbyX(1)*log2(pYbyX(1))+pYbyX(2)*log2(pYbyX(2))
end