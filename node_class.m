classdef node_class

properties
    id_n
    branches
    aerodynamic_type
    thermodynamic_type
    node_properties
    
    

end

methods
    %Constructor
    function obj = node_class(id_n,branches)
        obj.id_n = id_n;
        obj.branches = branches;
    end
    
    %Node properties assign, depending on the aerodynamic type
    function obj = assign_property(aerodynamic_type)
        switch aerodynamic_type
            case 0
            case 1
            case 2
            case 3
            case 4
            case 5
            case 6
            case 7
            case 8
        end
    end
    
    
end

end