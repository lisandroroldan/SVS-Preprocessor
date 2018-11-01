classdef train_route_class

properties
   train_route_n
   %FORM 8A
   route_id
   train_scheduling_origin
   n_groups
   n_track_sections
   delay_time
   first_train_type
   min_coasting_vel
   coasting_option
   
   %FORM 8B
   n_trains
   train_groups %train groups
   
   %FORM 8C
   foward_end_location
   radius_curvature
   
   
end

methods
    %Constructor
    function obj = train_class(train_route_n)
       obj.train_route_n=train_route_n;
       
   
       
    end
end

end