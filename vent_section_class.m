classdef vent_section_class

properties
    %Form 5A
    id_n
    id_title
    starting_node_n
    ending_node_n
    section_type
    
    %Form 5B
    n_segments
    n_subsegments
    grate_free_area
    design_max_velocity
    wall_surf_temp
    initial_dry_bulb_temp
    initial_wet_bulb_temp
    stack_height
    
    %Form 5C
    fan_type
    t_switch_on
    t_switch_off
    direction
    
    %Form 5D
    segments
    

end

methods
    %Constructor
    function obj = vent_section_class(id_n,starting_node_n,ending_node_n,n_segments)
        obj.id_n = id_n;
        obj.starting_node_n = starting_node_n;
        obj.ending_node_n = ending_node_n;
        obj.n_segments=n_segments;
        for i=1:n_segments
            obj.segments{i}=vent_segment_class(i);
        end
        
    end
end

end