function [u1,u2,du1hdx1] = velFunc(kinem)
% Velocity functions and their derivatives

%Initialisation
r=kinem.r;
m=kinem.m;
x1=kinem.x1;
n_rps=kinem.n_rps;
h=kinem.gap.h;
V1=kinem.V1;
V2=kinem.V2;

u1=0;u2=0;
du1hdx1=zeros(1,m(1));

%Calculation
omega=n_rps/(2*pi);

%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%Enter your code here
%u1=
%u2=
u1h=u1.*h;

for j=1:m(1)
    %du1hdx1(j)=;
end
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

end