function  segment_structure

global SVS

n=size(SVS.INPUT_GEOMETRY.line_sections,1);

for i=1:n
    id_n=SVS.INPUT_GEOMETRY.line_sections(i,1);
    starting_node_n=SVS.INPUT_GEOMETRY.line_sections(i,2);
    ending_node_n=SVS.INPUT_GEOMETRY.line_sections(i,3);
    n_segments=SVS.INPUT_GEOMETRY.line_sections(i,4);
    SVS.LINE_SECTIONS{i}=line_section_class(id_n,starting_node_n,ending_node_n,n_segments);
end



