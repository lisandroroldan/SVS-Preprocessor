classdef vent_segment_class

properties
 %FORM3A
 section_id
 lenght
 area
 perimeter
 head_loss_positive_foward_lim
 head_loss_negative_foward_lim
 head_loss_positive_backward_lim
 head_loss_negative_backward_lim
end

methods
    function obj = vent_segment_class(id_n)
        obj.section_id = id_n;
    end
    
end

end