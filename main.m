clc;clear;
% Main function

%Read the original data
[data,trh,head]=ReadSegyConstantTraceLength('Rawdata.segy');
[x,y]=size(data); 
for i=1:y
    offset(i)=getfield(trh(i),'offset');
end
OFF=offset;
dt=head.dt/10^6;

%Input the maximum and minimum apparent velocities of coherent noise

Vmin=300;Vmax=2000;dv=10;

%N is the of length the time window and M is the number of traces
N=51;
M=11;
n=(N-1)/2;
dn=N-1;
yc1=zeros(N,y);

st1=50; st2=1000;
tt1=8;  tt2=281;

p=4;

mod=0; 

for i0=st1:dn:st2 
    for j0=tt1:tt2 
        yc1(i0-n:i0+n,j0)=cohnoi(Vmin,Vmax,dv,data,OFF,dt,i0,j0,M,N,p,mod);
    end
end

xc=data(1:st2+n,:);
xc(1:st1-n-1,:)=0;xc(:,1:tt1-1)=0;xc(:,tt2+1:y)=0;
X=xc(st1-n:st2+n,tt1:tt2);  
Y=yc1(st1-n:st2+n,tt1:tt2); 
Z=X-Y;                     

dx=tt1:tt2;
dy=dt*(st1-n:st2+n);

figure(1)
imagesc(dx,dy,X);title('Origial');colormap(gray);xlabel('Trace number');ylabel('Time (s)')
figure(2)
imagesc(dx,dy,Y);title('Linear noise');colormap(gray);xlabel('Trace number');ylabel('Time (s)')
figure(3)
imagesc(dx,dy,Z);title('Denoised data');colormap(gray);xlabel('Trace number');ylabel('Time (s)')

