function [C1_x, C2_x, C3_y] = get_model_curves(We_D_analytical, B_analytical, delta)

We_DLims = max(We_D_analytical);
gamma = 1/delta;
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(B_analytical)
    tau = (1 - B_analytical(i))*(1 + delta);
    if B_analytical(i) < 0.5
        chi = 1 - 0.25*(2 - tau)^2*(1 + tau);
    else
        chi = 0.25*tau^2*(3 - tau);
    end
    C1_x(i) = (delta*(1+delta^2)*(4*3.351 - 12))/(chi*(cos(asin(B_analytical(i))))^2);
    
    e_coal = min(1, (2.4*(gamma^3 - 2.4*gamma^2 + 2.7*gamma))/(We_D_analytical(i)));
    C3_y(i) = sqrt(e_coal);
    
    zeta = 0.5*B_analytical(i)*(1+delta);
    eta_1 = 2*(1-zeta)^2*(1-zeta^2)^0.5 - 1;
    eta_2 = 2*(delta - zeta)^2*(delta^2 - zeta^2)^0.5 - delta^3;
    C2_x(i) = (3*(7*(1+delta^3)^(2/3) - 4*(1+delta^2))*delta*(1+delta^3)^2) / (delta^6*eta_1 + eta_2);
    %this is a stopgap solution for unphysical solutions
    if C2_x(i)<0
        C2_x(i) = 2.2*max(We_DLims);
    end
end
end

