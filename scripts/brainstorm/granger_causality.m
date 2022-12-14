% Script generated by Brainstorm (04-Oct-2022)

% Input files
sFiles = [];
SubjectNames = {...
    '100307'};

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

% Process: Bivariate Granger causality NxN
sFiles = bst_process('CallProcess', 'process_granger1n', sFiles, [], ...
    'timewindow',   [], ...
    'scouts',       {'Desikan-Killiany', {'bankssts L', 'bankssts R', 'caudalanteriorcingulate L', 'caudalanteriorcingulate R', 'caudalmiddlefrontal L', 'caudalmiddlefrontal R', 'cuneus L', 'cuneus R', 'entorhinal L', 'entorhinal R', 'frontalpole L', 'frontalpole R', 'fusiform L', 'fusiform R', 'inferiorparietal L', 'inferiorparietal R', 'inferiortemporal L', 'inferiortemporal R', 'insula L', 'insula R', 'isthmuscingulate L', 'isthmuscingulate R', 'lateraloccipital L', 'lateraloccipital R', 'lateralorbitofrontal L', 'lateralorbitofrontal R', 'lingual L', 'lingual R', 'medialorbitofrontal L', 'medialorbitofrontal R', 'middletemporal L', 'middletemporal R', 'paracentral L', 'paracentral R', 'parahippocampal L', 'parahippocampal R', 'parsopercularis L', 'parsopercularis R', 'parsorbitalis L', 'parsorbitalis R', 'parstriangularis L', 'parstriangularis R', 'pericalcarine L', 'pericalcarine R', 'postcentral L', 'postcentral R', 'posteriorcingulate L', 'posteriorcingulate R', 'precentral L', 'precentral R', 'precuneus L', 'precuneus R', 'rostralanteriorcingulate L', 'rostralanteriorcingulate R', 'rostralmiddlefrontal L', 'rostralmiddlefrontal R', 'superiorfrontal L', 'superiorfrontal R', 'superiorparietal L', 'superiorparietal R', 'superiortemporal L', 'superiortemporal R', 'supramarginal L', 'supramarginal R', 'temporalpole L', 'temporalpole R', 'transversetemporal L', 'transversetemporal R'}}, ...
    'scoutfunc',    1, ...  % Mean
    'scouttime',    1, ...  % Before
    'removeevoked', 0, ...
    'grangerorder', 10, ...
    'outputmode',   3);  % Save average connectivity matrix (one file)

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);
% bst_report('Email', ReportFile, username, to, subject, isFullReport);

