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
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_vecseq  is
	generic 	(     
			SequenceLength		:	positive :=15;
			SequenceValue		: 	std_logic_vector := "100001110001001"
			);
	port 		( 
			clock		: in std_logic ;
			ena			: in std_logic 	:='1';
			sclr		: in std_logic	:='0';			
			aclr		: in std_logic  :='0';
			yout		: out std_logic 
			);	
end alt_dspbuilder_vecseq;

architecture seq_SYNTH of alt_dspbuilder_vecseq is
signal clr_signal : STD_LOGIC;
signal lclr_signal : STD_LOGIC;
signal counter : std_logic_vector(ToNatural(nbitnecessary(SequenceLength)-1) downto 0);
signal yout_int : STD_LOGIC;
signal yout_comb : STD_LOGIC;

begin

	u0: alt_dspbuilder_sAltrBitPropagate generic map(QTB=>DSPBuilderQTB, QTB_PRODUCT => DSPBuilderProduct, QTB_VERSION => DSPBuilderVersion)
                          port map   (d => yout_int, r => yout);

	fixed_constant:if SequenceLength=1 generate
		yout_int <=SequenceValue(0);
	end generate fixed_constant;
	
	
	resetable_sequence:if SequenceLength>1 generate
		process(clock, aclr)
		begin	
			if aclr='1' then 
				yout_int <= '0';
				counter <= (OTHERS => '0');					
			elsif clock'event and clock='1' then							
				if sclr='1' then				
					yout_int <= '0';
					counter <= (OTHERS => '0');										
				elsif ena='1' then
					if counter < int2ustd(SequenceLength-1 ,nbitnecessary(SequenceLength)+1) then
						counter <= counter + '1';
					else
						counter <= (OTHERS => '0');
					end if;
					yout_int <= yout_comb;
				end if;
			end if;
		end process;
		
		gen:for i in 0 to SequenceLength-1 generate
			yout_comb <= SequenceValue(i) when (counter=int2ustd(i,nbitnecessary(SequenceLength)+1)) else 'Z';
		end generate;
	
	end generate resetable_sequence;	

end seq_SYNTH;
