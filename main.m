%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   PREPROCESADOR ANALÍTICO PARA EL SVS                  %
%                           VER 0.1 (17/10/2018)                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; SVS=struct;

%1)GENERAL DATA 
[SVS] = FORM_1(SVS); 

%2) SYSTEM GEOMETRY
[SVS] = FORM_2(SVS,1); 

%3) SEGMENT DATA STRUCTURE
[SVS] = segment_structure(SVS); 