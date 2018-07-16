--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: © 2001 Altera Corporation. All rights reserved.  Your use of Altera 
-- Corporation's design tools, logic functions and other software and tools, and its 
-- AMPP partner logic functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any associated 
-- documentation or information are expressly subject to the terms and conditions 
-- of the Altera Program License Subscription Agreement, Altera MegaCore Function 
-- License Agreement, or other applicable license agreement, including, without 
-- limitation, that your use is for the sole purpose of programming logic devices 
-- manufactured by Altera and sold by Altera or its authorized distributors.  
-- Please refer to the applicable agreement for further details.
--------------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_ASAT is
	generic 	(     
			widthin		:	natural :=8;
			widthout		:	natural :=4; 
			lpm_signed	: 	BusArithm :=BusIsSigned
			);
	port 		( 
			xin		: in std_logic_vector(widthin-1 downto 0);
			yout		: out std_logic_vector(widthout-1 downto 0)
			);	
end alt_dspbuilder_ASAT;

architecture ASAT_SYNTH of alt_dspbuilder_ASAT is

	function  GetWidthUsgn(win: natural;wout: natural ) return natural is
		variable res : natural;
		begin
			if (win-wout>0) then
				res :=win-wout-1;
			else
				res := 0;
			end if;
			return res; 
		end ;	

	function  GetOverFlowRangeUsgn(win: natural;wout: natural ) return natural is
		variable res : natural;
		begin
			if (win=wout) then
				res := wout-1;
			else
				res := wout;
			end if;
			return res; 
		end ;	

	signal msbone 			: std_logic_vector(widthin-widthout downto 0);
	signal msbzero 			: std_logic_vector(widthin-widthout downto 0);
	signal Unsignedmsbzero 	: std_logic_vector(GetWidthUsgn(widthin,widthout) downto 0);
	signal MsbOverFlow			: std_logic;
    signal InPositive       : std_logic;

begin

sat:if (widthin>=widthout) generate

	Gs : if lpm_signed=BusIsSigned generate
		
		msbone <= (others=>'1');
		msbzero <= (others=>'0');
		MsbOverFlow <= '0' when (xin(widthin-1 downto widthout-1) = msbone or xin(widthin-1 downto widthout-1) = msbzero) else '1';
			
		process(xin,MsbOverFlow)
		begin
			if (MsbOverFlow='0') then 
				yout(widthout-1 downto 0) <= xin(widthout-1 downto 0);
			else
				if (xin(widthin-1)='0') then
					for i in 0 to widthout-2 loop
						yout(i) <= '1';	-- max positif
					end loop;
					yout(widthout-1) <='0';
				else
					for i in 0 to widthout-2 loop
						yout(i) <= '0';	-- max Negatif
					end loop;
					yout(widthout-1) <='1';
			end if;
		end if;	
		end process;	
	end generate Gs;
	
	Gus : if  lpm_signed=BusIsUnsigned generate
		Unsignedmsbzero		<= (others=>'0');
		MsbOverFlow 			<= '0' when xin(widthin-1 downto GetOverFlowRangeUsgn(widthin, widthout)) = Unsignedmsbzero else '1';
        InPositive              <= '1' when xin(widthin-1) = '0' else '0';
		process(xin,MsbOverFlow,InPositive)
		begin
			if (MsbOverFlow='0') then 
				yout(widthout-1 downto 0) <= xin(widthout-1 downto 0);
			else
                if (InPositive='1') then -- Input was positive
    				yout <=(others=>'1'); -- Max Positive
                else 
    				yout <=(others=>'0'); -- Input was negative, need to output all zeros for unsigned output
                end if;
			end if;
		end process;			
	end generate Gus;

end generate sat;

end ASAT_SYNTH;


