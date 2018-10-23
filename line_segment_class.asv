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
 perimeter_roughness_matrix
 %FORM3C
 head_loss_positive_foward_lim
 head_loss_negative_foward_lim
 head_loss_positive_backward_lim
 head_loss_negative_backward_lim
 wet_wall_surf
 n_subsegments
 n_steady_heat_sources
 %FORM3D
 steady_heat_source_prop
 %FORM3E
 wall_surf_air_prop
 %FORM3F
 tunnel_wall_thickness
 dist_adjacent
 tunnel_wall_cond
 tunnel_wall_diff
 soil_cond
 soil_diff
 deep_sink_temp

end

methods
    function obj = line_segment_class(id_n)
        obj.section_id = id_n;
        obj.perimeter_roughness_matrix=cell(2,8);
        obj.steady_heat_source_prop=cell(6,20);
        obj.wall_surf_air_prop=cell(5,20);
    end
    
end

end