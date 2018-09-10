clear; clc; close all;

We_DLims = 250;
resolution = 200;
We_D_analytical = linspace(0, max(We_DLims), resolution);
B_analytical  = linspace(0, 1 , resolution);
delta = 1;
[We_grid, B_grid] = meshgrid(We_D_analytical, B_analytical);

[C1_x, C2_x, C3_y] = get_model_curves(We_D_analytical, B_analytical, delta);
[estrade, poo, achuth, brazier, qian] = get_experimental_csv_data();

[outcome_matrix] = get_populated_outcome_mat(We_D_analytical, B_analytical, delta);

figure()
contourf(We_grid, B_grid, outcome_matrix')
colormap(parula(4));
c = colorbar;
c.Ticks = [1, 2, 3, 4];
c.TickLabels = {'Bounce','Coal.','Reflex.','Stretch'};

xlabel('We_D')
ylabel('B')

%% Model Curves (add more!)
figure()
hold on
an_1 = plot(C1_x, B_analytical, 'b', 'LineWidth', 2);
an_2 = plot(We_D_analytical, C3_y, 'b', 'LineWidth', 2);
an_3 = plot(C2_x, B_analytical, 'b', 'LineWidth', 2);

ach_1 = plot(achuth.bounce.x, achuth.bounce.y, 'k--', 'LineWidth', 3);
ach_2 = plot(achuth.stretching.x, achuth.stretching.y, 'k--', 'LineWidth', 3);
ach_3 = plot(achuth.reflexive.x, achuth.reflexive.y, 'k--', 'LineWidth', 3);

br_3 = plot(brazier.C3.x, brazier.C3.y, 'r--', 'LineWidth', 3);

xlim([0 We_DLims])
ylim([0 1])

%%
close all; clc;
[error_struct] = get_errors_wrt_all_datasets(We_D_analytical, B_analytical);
outcome_names = [{'coalescence'},{'bounce'},{'separation'}];
color = [{'r'},{'g'},{'b'}];
figure()
hold on
for i=1:length(outcome_names)
    scatter(qian.all.(outcome_names{i}).x, qian.all.(outcome_names{i}).y, color{i})
end
%[error_table] = get_condensed_error_data(error_struct);