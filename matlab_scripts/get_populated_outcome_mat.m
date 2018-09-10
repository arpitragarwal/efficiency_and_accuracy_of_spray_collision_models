function [outcome_matrix] = get_populated_outcome_mat(We_D_analytical, B_analytical, delta)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
outcome_matrix = zeros(length(We_D_analytical), length(B_analytical));
[C1_x, C2_x, C3_y] = get_model_curves(We_D_analytical, B_analytical, delta);

for i = 1:length(We_D_analytical)
    for j = 1:length(B_analytical)
        We = We_D_analytical(i);
        B  = B_analytical(j);
        outcome_matrix(i, j) = get_collision_model_prediction(We, B, We_D_analytical, B_analytical, C1_x, C2_x, C3_y);
    end
end

end

