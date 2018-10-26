classdef fan_class

properties
    fan_n
    fan_identification
    reference_air_density
    t_full_speed
    lower_flow_limit
    upper_flow_limit
    exaust_pressure_curve=cell(2,4);
    supply_pressure_curve=cell(2,4);
    impulse_static_thrust
    impulse_pressure_eff
    impulse_nozzle_dis_vel
    t_impulse_on
    t_impulse_off
    reference_air_density_thrust
    derating_option
end

methods
    %Constructor
    function obj = fan_class(fan_n)
       obj.fan_n=fan_n;
       obj.exaust_pressure_curve{1,1}=0;
       obj.exaust_pressure_curve{1,2}=0;
       obj.exaust_pressure_curve{1,3}=0;
       obj.exaust_pressure_curve{1,4}=0;
       obj.exaust_pressure_curve{2,1}=0;
       obj.exaust_pressure_curve{2,2}=0;
       obj.exaust_pressure_curve{2,3}=0;
       obj.exaust_pressure_curve{2,4}=0;
       obj.supply_pressure_curve=obj.exaust_pressure_curve;
    end
end

end