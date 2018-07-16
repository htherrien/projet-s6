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

entity alt_dspbuilder_AROUND is
	generic 	(     
			widthin		:	natural :=8;
			widthout	:	natural :=4 
			);
	port 	( 
			xin		: in std_logic_vector(widthin-1 downto 0);
			yout	: out std_logic_vector(widthout-1 downto 0)
			);	
end alt_dspbuilder_AROUND;

architecture AROUND_SYNTH of alt_dspbuilder_AROUND is

	signal ADDOFIVE		: std_logic_vector(widthin downto 0) ;
	signal XINEXT			: std_logic_vector(widthin downto 0) ;
	signal YOUTEXT		: std_logic_vector(widthin downto 0);
	signal notsigned		: std_logic :='0';

begin

	ev:if widthin=widthout generate
		yout <= xin;
	end generate ev;

	nev:if (widthin>widthout) generate
		ad5:if (widthin-widthout>1) generate
			lo:for i in 0 to widthin-widthout-2 generate
				ADDOFIVE(i) <= '1';
			end generate lo;	
			hi:for i in widthin-widthout-1 to widthin generate
				ADDOFIVE(i) <= '0';
			end generate hi;
		end generate ad5;

		adn:if (widthin-widthout=1) generate
			hi:for i in 0 to widthin generate 
				ADDOFIVE(i) <= '0';				
			end generate hi;		 
		end generate adn;
		
		XINEXT(widthin-1 downto 0) <= xin(widthin-1 downto 0);
		XINEXT(widthin) <= xin(widthin-1);
		notsigned <= not(XINEXT(widthin-1));

		YOUTEXT <= XINEXT  + ADDOFIVE + notsigned;
		gy:for i in 0 to widthout-1 generate
			yout(i) <= YOUTEXT(i+widthin-widthout) ;
		end generate gy;
	end generate ;

end AROUND_SYNTH;

