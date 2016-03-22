function DEMO_config_v2
%__________________________________________________________________________
% DDTBOX script written by Stefan Bode 01/03/2013
%
% The toolbox was written with contributions from:
% Daniel Bennett, Jutta Stahl, Daniel Feuerriegel, Phillip Alday
%
% The author further acknowledges helpful conceptual input/work from: 
% Simon Lilburn, Philip L. Smith, Carsten Murawski, Carsten Bogler,
% John-Dylan Haynes
%__________________________________________________________________________
%
% This script is the configuration script for the DDTBOX. All
% study-specific information for decoding, regression and groupl-level
% analyses are specified here.
%
%__________________________________________________________________________
%
% Variable naming convention: STRUCTURE_NAME.example_variable

global SLIST
global SBJTODO
global CALL_MODE;

%% GENERAL STUDY PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

savemode=0;

bdir='F:\MVPA_WORKSHOP\';
output_dir='F:\MVPA_WORKSHOP\DECODING_RESULTS\preanalysed\';

% subject codes/names
sbj_code = {...
    
    ['DATA\sbj1\SBJ1_run'];... %1

    };

nsbj=size(sbj_code,1);


%% CREATE SLIST %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

SLIST=[];
sn=SBJTODO;
   
    % subject parameters
    SLIST.number=sn;
    SLIST.sbj_code=sbj_code{sn};
    SLIST.output_dir=output_dir;
    SLIST.data_struct_name='eeg_sorted_cond';
    
    % channels    
    SLIST.nchannels=64;
    SLIST.channels='channel_labels';
    SLIST.channel_names_file='channel_inf.mat';
    SLIST.channellocs=[bdir 'locations\'];
    SLIST.eyes=[];
    SLIST.extra=0;
    
    % sampling rate and baseline
    SLIST.sampling_rate=1000;
    SLIST.pointzero=100; % corresponds to zero (time-locked to this event, in ms)
     
        
%% CREATE DCGs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

    % decoding: conditions and classes 
    SLIST.cond_labels{1}='0same';
    SLIST.cond_labels{2}='180same';
    SLIST.cond_labels{3}='0diff';
    SLIST.cond_labels{4}='180diff';
        
    % discrimination groups
    SLIST.dcg{1}=[1 3]; % 
    SLIST.dcg{2}=[2 4]; % 
              
    SLIST.dcg_labels{1}='0SD';
    SLIST.dcg_labels{2}='180SD';
       
    SLIST.ndcg=size(SLIST.dcg,2);
    SLIST.nclasses=size(SLIST.dcg{1},2);      
    SLIST.ncond=size(SLIST.cond_labels,2);
    
    SLIST.data_open_name=[bdir (sbj_code{sn}) '.mat'];
    SLIST.data_save_name=[bdir (sbj_code{sn}) '_data.mat'];
    
    
%% SAVE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%__________________________________________________________________________

if savemode==1
    
    save(SLIST.data_save_name,'eeg_sorted_cond','SLIST');
    
end  

