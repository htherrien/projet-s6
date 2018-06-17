classdef systeme < handle
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        components
        G
        F
        minSig
        maxSig
        Te
        NO
        dataPointsSmall = [1,1]
        dataPointsLarge = [1,1]
        IP3
        Gr
    end
    properties (Access = private)
        k = 1.38e-23
        T0 = 290
        SO_NO = 10 %EN PAS dB MERCI
        TA = 300
        B = 2e6
        f = 2.45e9
        c = 300e6
        R = 2000
    end
    methods
        function obj = systeme(components)
            obj.components = components;
        end
        function calculateGF(self)
            self.G(1) = self.components(1).G;
            self.F(1) = self.components(1).F;
            for i = 2:length(self.components)
                self.G(i) = self.G(i - 1) * self.components(i).G;
                self.F(i) = self.F(i-1) + (self.components(i).F - 1)/self.G(i-1);
            end
        end
        function calculate(self)
            self.calculateGF()
            self.minSig = self.k*self.B*(self.TA+(self.F(end)-1)*self.T0)*self.SO_NO;
            self.Te = (self.F - 1)*self.T0;
            self.NO = self.k*(self.TA + [0 self.Te])*self.B.*[1 self.G];
            self.dataPointsSmall = [1 1 self.G]*self.minSig();
            
            Goffset = [1 self.G];
            maxSigs = []; IP3 = 0;
            for i = 1:length(self.components)
                if(~isnan(self.components(i).P))
                    maxSigs(end+1) = self.components(i).P / Goffset(i);
                    IP3 = IP3 + 1/(self.components(i).IP3 / Goffset(i));
                end
            end
            self.IP3 = 1/IP3;
            self.maxSig = min(maxSigs);
            self.dataPointsLarge = [1 1 self.G]*self.maxSig;
        end
        function diagram(self)
            figure()
            ylabel('Puissance (dBm)')
            hold on
            xStep = addSin(mag2dbPow(self.NO));
            plot(xStep, mag2dbPow(self.dataPointsSmall) + 30)
            plot(xStep, mag2dbPow(self.dataPointsLarge) + 30)
            for i = 1:length(self.components)
                if ~isnan(self.components(i).P)
                    P = max([self.components(i).P self.components(i).P*self.components(i).G]);
                    plot([xStep(i+1),xStep(i+2)], mag2dbPow([P P]) + 30,'k')
                end
            end
            for i = 2:length(self.dataPointsSmall)
                plot([xStep(i),xStep(i)], mag2dbPow([0.9*min(self.NO), 100*max(self.dataPointsLarge)]) + 30,'k--')
            end
            legend('Bruit', 'Signal minimum', 'Signal maximum', 'Points de compression')
        end
        function Gr = calculateAntenna(self, Gadj, Pt)
            lambda = self.c/self.f;
            Gr = self.minSig*(4*pi)^2*self.R^2.7/(lambda^2*Pt*dbPow2mag(Gadj));
        end
    end

end

