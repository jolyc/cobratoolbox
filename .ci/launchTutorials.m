% define global paths
global GUROBI_PATH
global ILOG_CPLEX_PATH
global TOMLAB_PATH

% include the root folder and all subfolders
addpath(genpath(pwd))

% run the official initialisation script
initCobraToolbox

if ~isempty(strfind(getenv('HOME'), 'jenkins'))
    WAITBAR_TYPE = 0;
else
    WAITBAR_TYPE = 1;
end

% define a success exit code
exit_code = 0;
currentDir = pwd;
try
    % retrieve the models first
    retrieveModels;

    % run an example of sparseLP
    changeCobraSolver('glpk')
    sparseLP_example;
    uniformSampling;
    tutorial_IO;
    tutorial_modelManipulation;
    tutorial_modelCreation;
    tutorial_numCharact;
    %reset the path.
    cd(currentDir)
    % ensure that we ALWAYS call exit
    exit(exit_code);
catch
    exit(1);
end
