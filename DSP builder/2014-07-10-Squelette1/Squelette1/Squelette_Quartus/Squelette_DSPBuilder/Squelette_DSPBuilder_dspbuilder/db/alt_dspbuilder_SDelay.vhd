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
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_SDelay is
	generic (     
			lpm_width			: positive :=8;
			lpm_delay			: positive :=2;
			SequenceLength		: positive :=1;
			SequenceValue		: std_logic_vector :="1"
			);
	port 	( 
			dataa		        : in std_logic_vector(lpm_width-1 downto 0);
			clock		        : in std_logic ;
			ena			        : in std_logic 	:='1';
			aclr		        : in std_logic	:='0';
			user_aclr			: in std_logic  :='0';
			sclr		        : in std_logic	:='0';
			result		        : out std_logic_vector(lpm_width-1 downto 0) :=(others=>'0')
			);	
end alt_dspbuilder_SDelay;

architecture SDelay_SYNTH of alt_dspbuilder_SDelay is

type StdUArray is array (lpm_delay-1 downto 0) of std_logic_vector (lpm_width-1 downto 0);
signal DelayLine : StdUArray;

signal dataa_int    : std_logic_vector(lpm_width-1 downto 0);
signal seqenable	: std_logic ;
signal enadff		: std_logic ;
signal aclr_i		: std_logic ;

begin
	aclr_i <= aclr or user_aclr;
	
	u0: alt_dspbuilder_sAltrPropagate generic map(QTB=>DSPBuilderQTB, QTB_PRODUCT => DSPBuilderProduct, QTB_VERSION => DSPBuilderVersion , width=> lpm_width)
	                   port map   (d => dataa, r => dataa_int);
	
	gnoseq: if ((SequenceLength=1) and (SequenceValue="1")) generate 
		enadff <= ena;
	end generate gnoseq;

	gseq: if not ((SequenceLength=1) and (SequenceValue="1")) generate 
		u:alt_dspbuilder_vecseq 	generic map 	(SequenceLength=>SequenceLength,SequenceValue=>SequenceValue)
				port map		(clock=>clock, ena=>ena, aclr=>aclr_i, sclr=>sclr, yout=> seqenable);	
		enadff <= seqenable and ena;
	end generate gseq;

	gen1:if lpm_delay=1 generate	
		process(clock, aclr_i)
		begin
			if aclr_i='1' then
				result <=(others=>'0');
			elsif clock'event and clock='1' then
				if (sclr ='1') then
					result <=(others=>'0');
				elsif enadff ='1' then
					result <= dataa_int;
				end if ;
			end if ;		
		end process ;
	end generate ;

	gen2:if lpm_delay>1 generate	
		process(clock, aclr_i)
		begin
			if aclr_i='1' then
				DelayLine <= (others => (others => '0'));
			elsif clock'event and clock='1' then
				if (sclr='1') then
					DelayLine <= (others => (others => '0'));
				elsif (enadff='1') then
					DelayLine(0)	<= dataa_int;
					for i in 1 to lpm_delay-1 loop
						DelayLine(i) <= DelayLine(i-1); 
					end loop;
				end if ;
			end if ;
		end process ;	
		result	<= DelayLine(lpm_delay-1);
	end generate ;
	
end SDelay_SYNTH;

