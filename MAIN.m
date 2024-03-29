%Rotor dynamics trial program. For studying purposes only
clear
clc
%Part 1. Pressure field, resulting force and torque for the one-dimentional
%Reynolds equation

%Please add your code to the higlihted regions of the following functions:
%velFunc.m,
%pressureField.m

%% Input data and parameters
 %Geometric parameters
r=20e-3;% rotor radius,m
h0=95e-6;% bearing clearance (mean gap),m
R=r+h0;% bearing radius, m
L=20e-3;% bearing length,m

e_r=1e-1;% relative eccentricity of a shaft in a bearing,e_r=e/h0,0<=e_r<=1
X1=-(e_r*h0); X2=-sqrt((e_r*h0)^2-X1^2);% initial position of a shaft

m=[9 3 9];% mesh parameters along x1 and x2 axis relatively
x1=linspace(0,2*pi*r,m(1)+2);% x1 mesh including 1 extra point 
x3=linspace(0,L,m(3));% x1 mesh including 1 extra point 
s=[x1(2)-x1(1) 0 x3(2)-x3(1)];
 %Kinematic parameters
n_rps=3e+3/60;%shaft speed, rps
V1=0; V2=0;%initial velocity of a rotor lateral vibrations, m/s
 %Dynamic parameters
mu=1e-3;% fluid viscosity, Pa*s
 %Static parameters
p0=2e5;%boundary conditions for the uncknown pressure function
 
%% Pressure field, resulting force and torque

%Geometric functions
geom=Geom_prop(X1,X2,e_r,r,R,h0,L,m,x1,x3,s);%create class instance (CI)
gap=geom.fun_gap%upload results
%Kinematic functions
kinem=Kinem_prop(n_rps,V1,V2,gap,X1,X2,e_r,r,R,h0,L,m,x1,x3,s);%create CI
vel=kinem.fun_vel%upload results
%Static functions
static=Static_prop(p0,mu,vel,n_rps,V1,V2,gap,X1,X2,...
                            e_r,r,R,h0,L,m,x1,x3,s);%create CI
pf=static.fun_pf%upload results                        

%Visualisation
p=pf.p;%1D pressure field
figure ('Color','w')
surf(x1,x3,p)
xlabel('{\itx_1} , m')
ylabel('{\itx_3} , m')
zlabel('{\itp} , Pa')
grid on

