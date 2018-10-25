function obj=node_prop_thermo_class_def(type)

switch type

    case 1
    obj=[];
    case 2
    obj=node_thermo_type1_class;
    case 3
    obj=node_thermo_type2_class;

end

    
    
end