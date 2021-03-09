function yc=cohnoi(Vmin,Vmax,dv,data,OFF,dt,i0,j0,M,N,p,mod)
%Construct the noise model
%Input parameters :
%         Vmin - minimum apparent velocities of coherent noise
%         Vmax - maximum apparent velocities of coherent noise
%         dv   - scanning interval
%         data - seismic data
%         OFF  - offset
%         dt   - sample interval
%         i0,j0- i0 and j0 denote the i0-th sample point and the j0-th trace, respectively
%         M    - number of seismic traces
%         N    - number of sample points
%         p    - number of adjacent elements of the median value
%         Mod  - weighting flag
%Output parameter :
%         yc   - noise model

[R,km,w]=step1(Vmin,Vmax,dv,data,OFF,dt,i0,j0,M,N);

y=step2(w,km,M,N,p);

yc=step3(y,R,mod);
end