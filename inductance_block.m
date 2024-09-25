function L= fcn( x,proj_len,Ag,N,coil_border,coil_outerdiameter)
% in general the current wave form is divided into two main parts 
%first part depends on the RLC configuration until the projectile plugs
%completely into the coil at x= width of lamination/2+ proj_length.
%after that the second part of the current begins, this part depends on the
%RL circuit and the parallel diode, this circuit is discharge circuit for
%the energy stored in the coil..

% We assume in all cases that the coil length equals to the projectile
% length

% We assume that x=0 is at the coil begining 

%% Lmax calulation
lg=2*coil_border/1000; % air gap length up and down the coil,it will be constant as it is the coil boundries هى الى هتمسك الملف لما يتلف
w=proj_len/1000; % 28/1000 % coil length
%Ag=(35*0.5*6+5*0.5*5)/1000000% prjectile area (it contains 35 laminations *0.5mm*6mm + 5 laminations *0.5mm*5mm)
q=0.95 % the iron yoke is rectangular cross section + the projectile is circular cross section so q=0.95 as an intermediate value
Kf= 1+((q*lg/sqrt(Ag))*log(2*w/lg));% fringing correction factor
u0=4*pi/10000000;
%N=165
Lmax=(N*N*Ag*Kf*u0)/(lg);
% Lmax=1635/1000000;
%% Lo calculation

Ag= (((1-exp(-1))*coil_outerdiameter)^2)*pi/4;% diameter of air gap area in this case equals to (1-e^-1) of the coil outer diameter
lg_noproj=(proj_len+coil_border)/1000;
Lo=(N*N*u0*Ag/lg_noproj);%iron yoke reluctance is not included 

%% L equation
center_position=proj_len/1000;
b=((center_position/2)*(center_position/2));
%Lmax=1610/1000000 %1159
delta_L=Lmax-Lo;
L=(delta_L*exp((-(x-center_position).^2)/b))+Lo;
% if x> ((proj_len-(coil_border))/1000) && x< ((proj_len+(coil_border))/1000)
%     x= ((proj_len-(coil_border))/1000);
%     L=(delta_L*exp((-(x-center_position)^2)/b))+Lo;
% else  
%     L=(delta_L*exp((-(x-center_position)^2)/b))+Lo
% end 



 
