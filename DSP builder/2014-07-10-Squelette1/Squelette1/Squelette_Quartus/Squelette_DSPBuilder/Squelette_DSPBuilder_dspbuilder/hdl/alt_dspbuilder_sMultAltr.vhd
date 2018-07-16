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

library LPM;
use LPM.LPM_COMPONENTS.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_sMultAltr is
	generic ( 
			lpm_widtha			: positive ;
			lpm_widthb			: positive ;
			lpm_representation	: string ;
			lpm_hint			: string ;
			OutputMsb			: natural ;
			OutputLsb			: natural ;
			pipeline			: natural 
			);
	port 	( 
			clock		: in std_logic;
			ena			: in std_logic;
            aclr		: in std_logic;
            user_aclr	: in std_logic;
			dataa		: in std_logic_vector(lpm_widtha-1 downto 0);
			datab		: in std_logic_vector(lpm_widthb-1 downto 0);
			result		: out std_logic_vector(OutputMsb-OutputLsb downto 0)
			);
end alt_dspbuilder_sMultAltr;

architecture synth of alt_dspbuilder_sMultAltr is

signal FullPrecisionResult 	: std_logic_vector(lpm_widtha+lpm_widthb-1 downto 0);
signal aclr_i   : std_logic;

begin

aclr_i <= aclr or user_aclr;

gcomb: if pipeline=0 generate
	U0 : lpm_mult
	GENERIC MAP (
		lpm_widtha => lpm_widtha,
		lpm_widthb => lpm_widthb,
		lpm_widthp => lpm_widtha+lpm_widthb,
		lpm_widths => 1,
		lpm_type => "LPM_MULT",
		lpm_representation => lpm_representation,
		lpm_hint => lpm_hint
	)
	PORT MAP (
		dataa => dataa,
		datab => datab,
		result => FullPrecisionResult
	);
end generate gcomb;

greg: if pipeline>0 generate
	U0 : lpm_mult
	GENERIC MAP (
		lpm_widtha => lpm_widtha,
		lpm_widthb => lpm_widthb,
		lpm_widthp => lpm_widtha+lpm_widthb,
		lpm_widths => 1,
		lpm_type => "LPM_MULT",
		lpm_representation => lpm_representation,
		lpm_hint => lpm_hint,
		lpm_pipeline => pipeline
	)
	PORT MAP (
		dataa => dataa,
		datab => datab,
		clken=> ena,
		aclr => aclr_i,
		clock => clock,
		result => FullPrecisionResult);
		
end generate greg;


g:for i in OutputLsb to OutputMsb generate
	result(i-OutputLsb) <= FullPrecisionResult(i);
end generate g;


end synth;

