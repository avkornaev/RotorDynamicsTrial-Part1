function [u1,u2,du1hdx1] = velFunc(kinem)
% Velocity functions and their derivatives

%Initialisation
r=kinem.r;
m=kinem.m;
s=kinem.s;
x1=kinem.x1;
n_rps=kinem.n_rps;
h=kinem.gap.h;
V1=kinem.V1;
V2=kinem.V2;

u1=zeros(1,length(x1));
u2=zeros(1,length(x1));
du1hdx1=zeros(1,length(x1));

%Calculation
omega=2*pi*n_rps;

%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%Enter your code here
%u1=;% tangential component
%u2=;% normal component
u1h=u1.*h;

for j=1:length(x1)
    %du1hdx1(j)=;% derivative d(u1*h)/dx1;
end
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

end