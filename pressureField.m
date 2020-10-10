function [p,F1,F2,M,Lambda,Gamma]=pressureField(static)
% Pressure field 

%Initialisation
r=static.r;
L=static.L;
m=static.m;
s=static.s;
x1=static.x1(2:end-1);%x1 excluding x1=0 and x1=2*pi,as well as p(0) and p(2*pi) are the same known value
x3=static.x3;
h=static.gap.h(2:end-1);
hpow3=static.gap.hpow3(2:end-1);
dhpow3dx1=static.gap.dhpow3dx1(2:end-1);
u1=static.vel.u1(2:end-1);
u2=static.vel.u2(2:end-1);
du1hdx1=static.vel.du1hdx1(2:end-1);
mu=static.mu;
p0=static.p0;

% Zero-value matriсes
A=zeros(1,m(1));
B=zeros(1,m(1));
C=zeros(1,m(1));
D=zeros(1,m(1));
E=zeros(1,m(1));
G=zeros(1,m(1));

Lambda=zeros(m(1),m(1));
Gamma=zeros(m(1),1);

p=zeros(1,m(1));
F1=0;F2=0;M=0;
subF1=zeros(m(3),m(1));
subF2=zeros(m(3),m(1));
subM=zeros(m(3),m(1));

%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%Enter your code here

% Matrices of coefficients 
%A=;
B=B;
C=C;
%D=;
%E=;
%G=;
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

% Matrix form for the Reynolds equation: Lambda*P=Gamma
for j=1:m(1)
    Lambda(j,j) =A(1,j);%filling the diagonal components of the 'A' matrix
    %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    %Enter your code here and fill the 'Lambda' and the 'Gamma' matrices 

    
    
    
    
    
    %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
end
%1D pressure field
p=Lambda\Gamma%solving matrix equation
p=[p0 p' p0];%adding the extra point with the known pressure value
%2D pressure field
p=meshgrid(p,x3);


%Projections of the resulting force and the torque
x1=static.x1;%return the full matrix x1 
h=static.gap.h;%return the full matrix h
u1=static.vel.u1;%return the full matrix u1
for i=1:length(x3)
    for j=1:length(x1)
        subF1(i,j)=-p(i,j)*sin(x1(j)/r);
        %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        %Enter your code here
        %subF2(i,j)=;
        %subM(i,j)=;
        %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    end
end
F1=dblintegral(subF1)*(2*pi*r*L);%the correct answer is about 0 N    
F2=dblintegral(subF2)*(2*pi*r*L);%the correct answer is about 10.5 N    
M = dblintegral(subM)*(2*pi*r*L); %the correct answer is about 0.0034 N*m    
end

