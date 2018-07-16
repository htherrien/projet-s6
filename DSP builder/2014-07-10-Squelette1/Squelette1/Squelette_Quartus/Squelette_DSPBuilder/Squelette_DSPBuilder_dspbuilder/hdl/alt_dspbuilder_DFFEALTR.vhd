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



LIBRARY ieee;
USE ieee.std_logic_1164.all;

library altera;
use altera.alt_dspbuilder_package.all;

ENTITY alt_dspbuilder_DFFEALTR IS	
	generic
	(
		width		: natural:=1
	);
	PORT
	(
		d		: IN STD_LOGIC_VECTOR(width-1 DOWNTO 0);
		clock   : IN STD_LOGIC;
		ena		: IN STD_LOGIC;
		prn		: IN STD_LOGIC;
		clrn	: IN STD_LOGIC;
		q		: OUT STD_LOGIC_VECTOR(width-1 DOWNTO 0)
	);
END alt_dspbuilder_DFFEALTR;

ARCHITECTURE SYN OF alt_dspbuilder_DFFEALTR IS
	component DFFE	
		PORT
		(
			d		: IN STD_LOGIC;
			clk 	: IN STD_LOGIC;
			ena		: IN STD_LOGIC;
			prn		: IN STD_LOGIC;
			clrn	: IN STD_LOGIC;
			q		: OUT STD_LOGIC
		);
	END component;

BEGIN
-- Use one DFFE for each bit
	genD:for I in 0 to width - 1 generate
		U0 : DFFE	PORT MAP (
			d		=> 	d(I),
			clk		=>	clock,
			ena 	=> 	ena,
			prn 	=> 	prn,
			clrn 	=> 	clrn,
			q		=> 	q(I)
		);
	END generate genD;
END SYN;

