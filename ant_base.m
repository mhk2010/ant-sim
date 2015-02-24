classdef ant_base
    %ant_base for simulating ant locomotor dynamics
    %   
    
    properties
        ste;    %states
        IC;     %initial conditions
        pm;     %parameters
        data;   %save data
        ni;     %numerical integration parameters        
    end
    
    methods
        function obj = ant_base() %constructor
            %assigns model properties to the object
            % segment weights from SEB p.25
            obj.pm.m_gaster = 12.5e-6;  %kg gaster weight
            obj.pm.m_caput = 3.5e-6;    %kg caput weight
            obj.pm.m_thorax = 3.4e-6;   %kg thorax weight
            obj.pm.m_ant = 21e-6;       %kg ant weight
            % COM positions from SEB p.21
            obj.pm.d_gaster = -1.4e-3;   %m distance from COM
            obj.pm.d_thorax = 2e-3;     %m distance from COM
            obj.pm.d_caput = 6.2e-3;    %m distance from CoM
            %moment of inertia
            obj.pm.J = obj.pm.m_gaster * obj.pm.d_gaster^2 + ...
                obj.pm.m_thorax * obj.pm.d_thorax^2 + ...
                obj.pm.m_caput * obj.pm.d_caput^2;  %kgm^2
            %leg attachment points from SEB p.25
            obj.pm.d_ant = 2e-3;        %m distance anterior legs from COM
            obj.pm.d_med = 1.2e-3;      %m distance median legs from COM
            %spring legs resting length
            obj.pm.l0_ant = 
            
            %global parameters
            obj.pm.g = -9.81;            %m/s^2 gravitational acceleration
            
            
        end
    end
    
end

