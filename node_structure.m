function  node_structure

global SVS

n=size(SVS.INPUT_GEOMETRY.nodes,1);
c=0; %counter
for i=1:n
    id_n=SVS.INPUT_GEOMETRY.nodes(i,1);
    
    %look for branches
    n1=find(SVS.INPUT_GEOMETRY.line_sections(:,2)==id_n);
    n2=find(SVS.INPUT_GEOMETRY.line_sections(:,3)==id_n);
    lines=SVS.INPUT_GEOMETRY.line_sections([n1;n2],1);
    
    n1=find(SVS.INPUT_GEOMETRY.vent_sections(:,2)==id_n);
    n2=find(SVS.INPUT_GEOMETRY.vent_sections(:,3)==id_n);
    vents=SVS.INPUT_GEOMETRY.vent_sections([n1;n2],1);
    
    branches=[lines;vents]';
    
    
    
    SVS.NODE_DATA{i}=node_class(id_n,branches);
end

SVS.LINE_SECTIONS

