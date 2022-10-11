% Script generated by Brainstorm (04-Oct-2022)

% Input files
sFiles = {...
    'link|100307/100307_MEG_3-Restin_rmegpreproc/results_PNAI_MEG_MEG_GRAD_MEG_MAG_KERNEL_221007_1610.mat|100307/100307_MEG_3-Restin_rmegpreproc/data_100307_MEG_3-Restin_rmegpreproc_0001.mat'};

% Start a new report
bst_report('Start', sFiles);

% Process: Coherence NxN [2021]
sFiles = bst_process('CallProcess', 'process_cohere1n_2021', sFiles, [], ...
    'timewindow',   [0, 1.999498553], ...
    'scouts',       {'Desikan-Killiany', {'bankssts L', 'bankssts R', 'caudalanteriorcingulate L', 'caudalanteriorcingulate R', 'caudalmiddlefrontal L', 'caudalmiddlefrontal R', 'cuneus L', 'cuneus R', 'entorhinal L', 'entorhinal R', 'frontalpole L', 'frontalpole R', 'fusiform L', 'fusiform R', 'inferiorparietal L', 'inferiorparietal R', 'inferiortemporal L', 'inferiortemporal R', 'insula L', 'insula R', 'isthmuscingulate L', 'isthmuscingulate R', 'lateraloccipital L', 'lateraloccipital R', 'lateralorbitofrontal L', 'lateralorbitofrontal R', 'lingual L', 'lingual R', 'medialorbitofrontal L', 'medialorbitofrontal R', 'middletemporal L', 'middletemporal R', 'paracentral L', 'paracentral R', 'parahippocampal L', 'parahippocampal R', 'parsopercularis L', 'parsopercularis R', 'parsorbitalis L', 'parsorbitalis R', 'parstriangularis L', 'parstriangularis R', 'pericalcarine L', 'pericalcarine R', 'postcentral L', 'postcentral R', 'posteriorcingulate L', 'posteriorcingulate R', 'precentral L', 'precentral R', 'precuneus L', 'precuneus R', 'rostralanteriorcingulate L', 'rostralanteriorcingulate R', 'rostralmiddlefrontal L', 'rostralmiddlefrontal R', 'superiorfrontal L', 'superiorfrontal R', 'superiorparietal L', 'superiorparietal R', 'superiortemporal L', 'superiortemporal R', 'supramarginal L', 'supramarginal R', 'temporalpole L', 'temporalpole R', 'transversetemporal L', 'transversetemporal R'}}, ...
    'scoutfunc',    1, ...  % Mean
    'scouttime',    1, ...  % Before
    'removeevoked', 0, ...
    'cohmeasure',   'icohere2019', ...  % Imaginary Coherence (2019)IC    = |imag(C)|
    'win_length',   1, ...
    'overlap',      50, ...
    'maxfreq',      60, ...
    'outputmode',   'avgcoh');  % Average cross-spectra of input files (one output file)

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);
% bst_report('Email', ReportFile, username, to, subject, isFullReport);
