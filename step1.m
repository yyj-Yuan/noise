function  [R,km,w]=step1(Vmin,Vmax,dv,data,OFF,dt,i0,j0,M,N)
%Determination of the velocity of coherent noise

Nv=(Vmax-Vmin)/dv;
 
for k=0:Nv
    Vk(k+1)=Vmin+k*dv;
end

for i=1:N
    for j=1:M
        for k=1:Nv+1
            w(i,j,k)=data(floor(i0+i-N/2+abs(OFF(j-1+j0-((M-1)/2))-OFF(j0))/(Vk(k)*dt)),floor(j0+j-M/2));
        end
    end
end

a1=w.^2;
A1=sqrt(sum(a1,1)/N);

wa=w./A1;

r1=sum(wa,2);
r11=r1.^2;
r111=sum(r11,1);
r2=wa.^2;
r22=sum(r2,2);
r222=M*sum(r22,1);
r=r111./r222;

Ra=squeeze(r(1,1,:));
[R,km]=max(Ra);
end
