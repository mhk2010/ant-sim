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
            % Reinhard 2014 p.20
            obj.pm.m_gaster = 12.5e-6;  %kg gaster weight
            obj.pm.m_caput = 3.5e-6;    %kg caput weight
            obj.pm.m_thorax = 3.4e-6;   %kg thorax weight
            obj.pm.m_ant = 22e-6;       %kg ant weight
            % COM positions from SEB p.21
            obj.pm.d_gaster = -1.4e-3;   %m distance from COM
            obj.pm.d_thorax = 2e-3;     %m distance from COM
            obj.pm.d_caput = 6.2e-3;    %m distance from CoM
            %moment of inertia
            obj.pm.J = obj.pm.m_gaster * obj.pm.d_gaster^2 + ...
                obj.pm.m_thorax * obj.pm.d_thorax^2 + ...
                obj.pm.m_caput * obj.pm.d_caput^2;  %kgm^2
            %leg attachment points from SEB p.21 based on center of stride
            %length
            %obj.pm.d_ant = 4.2e-3;          %m distance anterior legs from COM
            %obj.pm.d_med = 0.9e-3;          %m distance median legs from COM
            %leg attachement points from SEB p.25 based
            obj.pm.d_ant = 2.7e-3;          %m distance anterior legs from COM
            obj.pm.d_med = 1.4e-3;          %m distance median legs from COM
            %spring legs resting length from SEB p.25 
            obj.pm.l0_ant = sqrt(4.2e-3^2 + 2e-3^2 + 4e-3^2);     %m resting length anterior leg
            obj.pm.l0_med = sqrt(2.2e-3^2 + 3.2e-3^2 + 5.2e-3^2);     %m resting length median leg  
            %spring legs stiffness from Reinhard 2014 p.20
            obj.pm.kx = 0.1005e3;   %N/m in x-direction
            obj.pm.kz = 0.0691e3;   %N/m in z-direction
            obj.pm.ky = 0.3598e3;   %N/m in y-direction
            %angle of attack from SEB p.25
            obj.pm.alpha_ant = atan(4/4.3);
            obj.pm.beta_ant = atan(2/4.2);
            obj.pm.alpha_med = atan(5.2/2.2);
            obj.pm.beta_med = atan(2.2/3.2);
            %global parameters
            obj.pm.g = -9.81;            %m/s^2 gravitational acceleration
            %integration parameter
            obj.ni.abs = 1e-6;          %absolue tolerance
            obj.ni.rel = 1e-6;          %relative tolerance
         end
    end
    
end

