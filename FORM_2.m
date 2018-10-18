function [SVS] = FORM_2(SVS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GENERAL DATA INPUT
%For more information of each element, check FORM 2A to FORM 2B in the SVS
%User manual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

%Nodes [id, x position, y position, z position]
GEOMETRY.NODES=[...
           1    1200  -50   0;
           2    1200   50   0;
           3    1020  -50   0;
           4    1020   50   0;
           5    840    0    0;
           6    810    0    0;
           7    750    0    50;
           8    690    0    0;
           9    660    0    0;
           10   510    0    0;
           11   300    0    0;
           50   1020  -50   100
           51   1050   50   100;
           52   750    0    100;
           53   510    0    100];

%Line sections [id, starting node, ending node, number of segments]
GEOMETRY.LINE_SECTIONS=[...
                1   1     3     3;
                2   2     4     1;
                5   3     5     1;
                6   4     5     1;
                7   5     6     1;
                8   6     7     1;
                9   6     8     1;
                11  7     8     1;
                12  8     9     1;
                13  9     10    1;
                15  10    11    2];

%Ventilation shaft sections [id, starting node, ending node]
GEOMETRY.VENT_SECTIONS=[...
                3   3     50;
                4   4     51;
                10  7     52;
                14  10    53];

%-------------------------------------------------------------------------%
%DO NOT EDIT UNDER THIS LINE

plot_network(GEOMETRY.NODES,GEOMETRY.LINE_SECTIONS,GEOMETRY.VENT_SECTIONS);

SVS.GEOMETRY=GEOMETRY;

%Count nodes, line sections, vent sections, segments and junctions and edit
%the general information variable

SVS.GENERAL_DATA.n_nodes=size(GEOMETRY.NODES,1);
SVS.GENERAL_DATA.n_sections=size(GEOMETRY.LINE_SECTIONS,1);
SVS.GENERAL_DATA.n_line_segments=sum(GEOMETRY.LINE_SECTIONS(:,4));
SVS.GENERAL_DATA.n_vents=size(GEOMETRY.VENT_SECTIONS,1);


%Auxiliary calculations
A=[GEOMETRY.LINE_SECTIONS(:,2:3);GEOMETRY.VENT_SECTIONS(:,2:3)];
c=0;
for i=1:max(max(A))
    d=sum(A(:)==i);
    if d>=3
        c=c+1;
    end
end
SVS.GENERAL_DATA.n_br_junct=c;

