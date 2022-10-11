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
    
%      % Process: Select data files in: 100307/*/3-Restin
%     sFiles = bst_process('CallProcess', 'process_select_files_data', sFiles, [], ...
%         'subjectname',   SubjectNames{1}, ...
%         'condition',     '', ...
%         'tag',          tag, ...
%         'includebad',    0, ...
%         'includeintra',  0, ...
%         'includecommon', 0);

    % Process: Select results files in: 100307/*/PNAI
    sFiles = bst_process('CallProcess', 'process_select_files_results', sFiles, [], ...
        'subjectname',   SubjectNames{1}, ...
        'condition',     '', ...
        'tag',           'PNAI', ...
        'includebad',    0, ...
        'includeintra',  0, ...
        'includecommon', 0);

    
   % Process: Add process here
   % Todo

    % Save and display report
    ReportFile = bst_report('Save', sFiles);
    bst_report('Open', ReportFile);
    % bst_report('Export', ReportFile, ExportDir);
    % bst_report('Email', ReportFile, username, to, subject, isFullReport);
end