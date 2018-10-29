classdef air_curtain_class

properties
    air_curtain_n
    air_curtain_id
    discharge_vel
    effective_tunnel_width
    slot_width
    angle_to_tunnnel_axis
    j_factor
    recovery_time
    max_tunnel_head_loss
    nozzle_type=0
end

methods
    %Constructor
    function obj = air_curtain_class(air_curtain_n)
       obj.air_curtain_n=air_curtain_n;
    end
end

end