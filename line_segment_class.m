classdef line_segment_class

properties
 %FORM3A
 section_id
 id_title
 line_segment_type
 length
 cross_section_area
 stack_height
 fire_segment
 constant_press_change
 %FORM3B
 perimeter
 roughness_length
 %FORM3C
 head_loss_positive_foward_lim
 head_loss_negative_foward_lim
 head_loss_positive_backward_lim
 head_loss_negative_backward_lim
 wet_wall_surf
 n_subsegments
 n_steady_heat_sources
 %FORM3D

end

methods
    function obj = line_segment_class(id_n)
        obj.section_id = id_n;
    end
    
end

end