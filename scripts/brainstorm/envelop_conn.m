%% Envolope Correlation
% iterate files
fid = fopen('n_files.txt');
while true
  thisline = fgetl(fid);
  if ~ischar(thisline); break; end  %end of file
    %now check whether the string in thisline is a "word", and store it if it is.
    %then
    disp('===== Working on file =====');
    disp(thisline);
    % Input files
    sFiles = [];
    SubjectNames = {...
        thisline};

    % Start a new report
    bst_report('Start', sFiles);

    % Process: Select results files in: 100307/*/PNAI
    sFiles = bst_process('CallProcess', 'process_select_files_results', sFiles, [], ...
        'subjectname',   SubjectNames{1}, ...
        'condition',     '', ...
        'tag',           'PNAI', ...
        'includebad',    0, ...
        'includeintra',  0, ...
        'includecommon', 0);

    
    % Process: Envelope Correlation NxN [2022]
    sFiles = bst_process('CallProcess', 'process_henv1n', sFiles, [], ...
        'timewindow',   [0, 1.999498553], ...
        'scouts',       {'Desikan-Killiany', {'bankssts L', 'bankssts R', 'caudalanteriorcingulate L', 'caudalanteriorcingulate R', 'caudalmiddlefrontal L', 'caudalmiddlefrontal R', 'cuneus L', 'cuneus R', 'entorhinal L', 'entorhinal R', 'frontalpole L', 'frontalpole R', 'fusiform L', 'fusiform R', 'inferiorparietal L', 'inferiorparietal R', 'inferiortemporal L', 'inferiortemporal R', 'insula L', 'insula R', 'isthmuscingulate L', 'isthmuscingulate R', 'lateraloccipital L', 'lateraloccipital R', 'lateralorbitofrontal L', 'lateralorbitofrontal R', 'lingual L', 'lingual R', 'medialorbitofrontal L', 'medialorbitofrontal R', 'middletemporal L', 'middletemporal R', 'paracentral L', 'paracentral R', 'parahippocampal L', 'parahippocampal R', 'parsopercularis L', 'parsopercularis R', 'parsorbitalis L', 'parsorbitalis R', 'parstriangularis L', 'parstriangularis R', 'pericalcarine L', 'pericalcarine R', 'postcentral L', 'postcentral R', 'posteriorcingulate L', 'posteriorcingulate R', 'precentral L', 'precentral R', 'precuneus L', 'precuneus R', 'rostralanteriorcingulate L', 'rostralanteriorcingulate R', 'rostralmiddlefrontal L', 'rostralmiddlefrontal R', 'superiorfrontal L', 'superiorfrontal R', 'superiorparietal L', 'superiorparietal R', 'superiortemporal L', 'superiortemporal R', 'supramarginal L', 'supramarginal R', 'temporalpole L', 'temporalpole R', 'transversetemporal L', 'transversetemporal R'}}, ...
        'scoutfunc',    1, ...  % Mean
        'scouttime',    1, ...  % Before
        'removeevoked', 0, ...
        'tfmeasure',    'hilbert', ...  % Hilbert transform
        'edit',         struct(...
             'Comment',         'Complex', ...
             'TimeBands',       [], ...
             'Freqs',           {{'delta', '2, 4', 'mean'; 'theta', '5, 7', 'mean'; 'alpha', '8, 12', 'mean'; 'beta', '15, 29', 'mean'; 'gamma1', '30, 59', 'mean'; 'gamma2', '60, 90', 'mean'}}, ...
             'ClusterFuncTime', 'none', ...
             'Measure',         'none', ...
             'Output',          'all', ...
             'RemoveEvoked',    0, ...
             'SaveKernel',      0), ...
        'tfsplit',      1, ...
        'cohmeasure',   'oenv', ...  % Envelope correlation (orthogonalized) 
        'statdyn',      'static', ...  % Dynamic
        'win_length',   1, ...
        'win_overlap',  50, ...
        'parallel',     1, ...
        'outputmode',   2);  % Average among output files (one file - only for trials)

    % Save and display report
    ReportFile = bst_report('Save', sFiles);
    bst_report('Open', ReportFile);
    % bst_report('Export', ReportFile, ExportDir);
    % bst_report('Email', ReportFile, username, to, subject, isFullReport);
end
