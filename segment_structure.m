function [SVS] = segment_structure(SVS)

n=size(SVS.GEOMETRY.LINE_SECTIONS,1);

for i=1:n
    id_n=SVS.GEOMETRY.LINE_SECTIONS(i,1);
    starting_node_n=SVS.GEOMETRY.LINE_SECTIONS(i,2);
    ending_node_n=SVS.GEOMETRY.LINE_SECTIONS(i,3);
    n_segments=SVS.GEOMETRY.LINE_SECTIONS(i,4);
    SVS.LINE_SECTIONS{i}=line_section_class(id_n,starting_node_n,ending_node_n,n_segments);
end

n

