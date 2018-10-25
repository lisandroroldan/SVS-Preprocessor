classdef node_class

properties
    id_n
    branches
    aerodynamic_type=0; %default
    thermodynamic_type=1; %default
    node_prop
    node_prop_thermo

end

methods
    %Constructor
    function obj = node_class(id_n,branches)
        obj.id_n = id_n;
        obj.branches = branches;
    end
end

end