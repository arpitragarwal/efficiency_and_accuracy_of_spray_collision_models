function [error_table] = get_condensed_error_data(error_struct)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    expt_data_sets = [{'estrade'},{'poo'},{'qian'}];
    for i = 1:length(expt_data_sets)
        if i==1
            delta_values = [{'delta_1'}, {'delta_0p5'}];
        elseif i==2
            delta_values = [{'delta_1'}, {'delta_0p75'}, {'delta_0p5'}];
        elseif i==3
        end
    end
end

