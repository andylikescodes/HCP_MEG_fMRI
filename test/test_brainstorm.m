% Start Brainstorm
cd /home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/brainstorm3;
if ~brainstorm('status')
   brainstorm server local
end

% Path to a Brainstorm database (= a folder that contains one or more Brainstorm protocols)
BrainstormDbDir = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/brainstorm_db';

% Load a new uploaded database (sets BrainstormDbDir and load all the protocols it contains)
db_import(BrainstormDbDir);

% Alternative: Set the Brainstorm DB folder
% (defines where the new protocols are going to be created, but does not load anything)
% bst_set('BrainstormDbDir', BrainstormDbDir);

% Get the protocol index of an existing protocol (already loaded previously in Brainstorm)
ProtocolName = 'preliminary_results';
iProtocol = bst_get('Protocol', ProtocolName);

% Create a new protocol if needed
%if isempty(iProtocol)
%   UseDefaultAnat = 0;
%   UseDefaultChannel = 0;
%   gui_brainstorm('CreateProtocol', ProtocolName, UseDefaultAnat, UseDefaultChannel);
%end

   % Delete an existing protocol
%gui_brainstorm('DeleteProtocol', ProtocolName);
