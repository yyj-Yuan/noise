function y=step2(w,km,M,N,p)
%Construction of the initial noise model

Uu=squeeze(w(:,:,km));

U=sort(Uu,2);
J0=(M+1)/2;

for i=1:N
    for j=1:p
        u(i,j)=U(i,J0-j)+U(i,J0+j);
    end
    u1(i)=sum(u(i,:));
    U11(i)=(U(i,J0)+u1(i))/(p+1);
end

y=U11';
end