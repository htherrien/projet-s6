classdef component
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        G           % Gain (valeur naturelle)
        F           % Facteur de bruit (valeur naturelle)
        P = NaN     % IP1 (W)
        IP3 = NaN   % IP3 (W)
        Pmax = NaN
    end
    
    methods
        function obj = component(L_GF, P, IP3)
            L_GF = dbPow2mag(L_GF);
            if (length(L_GF) == 1)        %component(F)
                obj.G = 1/L_GF;
                obj.F = L_GF;
            elseif (length(L_GF) == 2)    %component(G,F)
                obj.G = L_GF(1);
                obj.F = L_GF(2);
            end
            if nargin == 3
                obj.P = dbPow2mag(P - 30);
                obj.IP3 = dbPow2mag(IP3 - 30);
            end
        end
    end
end

