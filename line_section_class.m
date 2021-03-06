classdef line_section_class

properties
    id_n
    starting_node_n
    ending_node_n
    n_segments
    segments
end

methods
    %Constructor
    function obj = line_section_class(id_n,starting_node_n,ending_node_n,n_segments)
        obj.id_n = id_n;
        obj.starting_node_n = starting_node_n;
        obj.ending_node_n = ending_node_n;
        obj.n_segments=n_segments;
        for i=1:n_segments
            obj.segments{i}=line_segment_class(i);
        end
        
    end
end

end