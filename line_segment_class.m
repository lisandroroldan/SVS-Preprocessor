classdef line_segment_class

properties
 %FORM3A
 section_id
 line_segment_type
 id_title
 length
 cross_section_area
 stack_height
 fire_segment
 constant_press_change
 perimeter
 roughness_length
 %FORM3B
 head_loss_positive_foward_lim
 head_loss_negative_foward_lim
 head_loss_positive_backward_lim
 head_loss_negative_backward_lim
 wet_wall_surf
 n_subsegments
 n_steady_heat_sources
end

methods
    function obj = line_segment_class(id_n)
        obj.section_id = id_n;
    end
end

end