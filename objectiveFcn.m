function f = objectiveFcn(x)
global current_combination
% disp(x)
% pause(2)
% x(10) = 10000;
x(10) = x(10) * 50; % pour la force de serrage
[end_porosity_GDL_ass, end_contact_resistance_ass] = runModel(x)

% disp(end_contact_resistance_ass)
% disp(end_porosity_GDL_ass)
% pause(3)

f = end_contact_resistance_ass - end_porosity_GDL_ass;

logfile = 'final_results.txt';

% Créer un en-tête si le fichier n'existe pas
if ~isfile(logfile)
    fid = fopen(logfile, 'w');
    fprintf(fid, '%-5s %-80s %-25s %-25s %-25s %-25s\n', ...
        'Run', 'Combination (x1,x2,x3,...)', 'R_c_ass (AC)', 'Porosity_ass (AC)', 'eval (f)');
    fprintf(fid, '%s\n', repmat('-', 1, 185));
    fclose(fid);
end

% Enregistremt des paramètres d'entrée avant le blackbox
fid = fopen(logfile, 'a');
if fid == -1
    error('Impossible d''ouvrir le fichier %s', logfile);
end

% Créer la chaîne de combinaison au format (x1,x2,x3,...)
combination_str = sprintf('(%.0f,%.0f,%.0f,%.0f,%.0f,%.0f,%.0f,%.0f,%.0f,%.0f)', ...
    x(1), x(2), x(3), x(4), x(5), x(6), x(7), x(8), x(9), x(10));

% Compter le nombre de lignes existantes pour numéroter les runs
current_line = numel(readlines(logfile));
run_number = current_line - 1;

fprintf(fid, '%-5d %-80s ', run_number, combination_str);
fprintf(fid, '%-25.6f %-25.6f %-25.6f\n', ...
    end_contact_resistance_ass, end_porosity_GDL_ass, f);
fclose(fid);
end