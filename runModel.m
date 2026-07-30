function [end_porosity_GDL_ass, end_contact_resistance_ass] = runModel(x)
global current_combination
global all_combinations
global k 
k = 1;
% Échange des colonnes 3 et 4
exchange = x(3);
x(3) = x(4);
x(4) = exchange;
current_combination = x;
all_combinations(k, :) = x;

% Exécution du modèle blackbox

GMLin2009_GDLCarral2022_PEMKusoglu2009_MRGasket

% Extraction des résultats et enregistrement
end_contact_resistance_ass = R_c_ass(end);
end_porosity_GDL_ass = porosity_GDL_ass(end);

end