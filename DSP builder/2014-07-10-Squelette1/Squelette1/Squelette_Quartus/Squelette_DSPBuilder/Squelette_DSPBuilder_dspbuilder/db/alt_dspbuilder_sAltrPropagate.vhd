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

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_sAltrPropagate is
	generic (     
			WIDTH		    :	positive ;
			QTB 			:   string :="on";
			QTB_PRODUCT 	:   string :="DSP Builder";
			QTB_VERSION 	:   string :="6.0"
			);
	port 	( 
			d		: in std_logic_vector(WIDTH-1 downto 0);
			r		: out std_logic_vector(WIDTH-1 downto 0)
			);	
end alt_dspbuilder_sAltrPropagate ;

architecture sAltrPropagate_Synth of alt_dspbuilder_sAltrPropagate is 
begin
	r<=d;
end sAltrPropagate_Synth;


