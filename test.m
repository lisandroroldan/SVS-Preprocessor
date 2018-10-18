%Node matrix
close all; clear; clc;

%          n   x    y   z 
NODES=[    1    1200  -50   0;
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

%             n   node1 node2 n_subsegments
LINE_SECTIONS=[1   1     3     3;
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

%               n   node1 node2      
VENT_SECTIONS=[ 3   3     50;
                4   4     51;
                10  7     52;
                14  10    53];
          
plot_network(NODES,LINE_SECTIONS,VENT_SECTIONS)