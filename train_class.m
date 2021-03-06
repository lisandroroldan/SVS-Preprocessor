classdef train_class

properties
   %Form 9A
   train_n
   train_id
   n_cars
   n_powered_cars
   train_length
   frontal_area
   
   %Form 9B
   car_perimeter
   skin_friction_coeff
   wighted_drag_coeff
   front_drag_coeff
   rear_drag_coeff
   
   %Form 9C
   sensible_heat_aux_sys_car
   latent_heat_aux_sys_car
   sensible_heat_pass_patron
   latent_heat_pass_patron
   power_consumption_car
   power_consumption_patron
   
   %Form 9D
   resistor_mass_car
   resistor_diameter
   eff_surf_convection_car
   eff_surf_radiation_car
   resistor_emissivity
   resistor_specific_heat
   initial_grid_temp
   air_vel
   
   %Form 9E
   avg_car_weight
   n_motors_car
   trr_coeff_1
   trr_coeff_2
   trr_coeff_3
   eq_mass
   
   %Form 9F
   motor_id
   wheel_diameter_manuf
   wheel_diameter_actual
   gear_ratio_manuf
   gear_ratio_actual
   supply_V_manuf
   supply_V_actual
   terminal_V
   
   %Form 9G
   train_propulsion_curve=cell(3,4)
   train_controler_option
   
   %Form 9H
   line_current=cell(1,5)
   chopper_eff_leq_U1
   U1
   chopper_eff_geq_U1
   chopper_regenerative_braking
   onboad_flywheel_option
   
   %Form 9H-A
   motor_eff=cell(2,5)
   base_motor_eff
   power_E_regenerative_braking
   
   %Form 9I
   resistance_speed=cell(2,3);
   
   %Form 9J
   max_acceleration
   normal_desacceleration_V1
   V1
   normal_desacceleration_V2
   V2
   
   
end

methods
    %Constructor
    function obj = train_class(train_n)
       obj.train_n=train_n;
       
       for i=1:3; for j=1:4
       obj.train_propulsion_curve{i,j}=0;
       end; end;
       for i=1:5;
       obj.line_current{i}=0;
       end; 
       for i=1:2; for j=1:5
       obj.motor_eff{i,j}=0;
       end; end;
       for i=1:2; for j=1:3
       obj.resistance_speed{i,j}=0;
       end; end;
   
       
    end
end

end