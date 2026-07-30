% clean up
clear; clc; close all;
global current_combination
%% Peaks problem

% formulation du problème d'optimisation
problem.solver = 'ga';
problem.fitnessfct = @(x)objectiveFcn(x);
problem.nvars = 10;
% problem.nvars = 9;
problem.lb = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
% problem.lb = [1, 1, 1, 1, 1, 1, 1, 1, 1]; % lower bounds for the variables
problem.ub = [6, 5, 5, 3, 3, 3, 3, 4, 50, 240]; % 240 au lieu de 12000 pour avoir des pas de 50 pour la force de serrage
% problem.ub = [6, 5, 5, 3, 3, 3, 3, 4, 50]; % Upper bounds for the variables
problem.options = optimoptions( problem.solver,...
                                'Display', 'iter',...
                                'PlotFcn', [], ...%@gaplotbestfun
                                'PopulationSize', 1000, ...
                                'MaxGenerations', 10000, ...
                                'FunctionTolerance', 1e-9, ...
                                'MaxStallGenerations', 100);


%% lancement de l'algo optimisationi
% IntCon = 9;
IntCon = 1:problem.nvars;
[x, f, exitflag, output] = ga(problem.fitnessfct, problem.nvars, [], [],[],[], problem.lb, problem.ub,[], IntCon,problem.options)