function yc=step3(y,R,Mod)
%Modification of the initial noise model

c=zeros(size(y));
c1=0.6;
c2=0.8;

if R<=c1
    c=0;
elseif c1<R&&R<c2
    c=(R-c1)/(c2-c1);
else
    c=1;
end

if Mod==0
    yc=y;
else
    yc=y.*c;
end

end