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

entity alt_dspbuilder_SAdderSub is

	generic ( 
	 	 	lpm_width 			: positive 	:=8; -- input bus width 
	  		pipeline			: natural 	:=0;
			SequenceLength		: positive 	:=1;
			SequenceValue		: std_logic_vector 	:="1";
	  		AddSubVal			: AddSubOperator 	:=AddAdd 	 -- SubSub is illegal
		  	);		  
	port 	(
			dataa    	: in std_logic_vector(lpm_width-1 downto 0) ;
			datab    	: in std_logic_vector(lpm_width-1 downto 0) ;
			clock 		: in std_logic :='0';
			ena			: in std_logic :='1';
			aclr		: in std_logic :='0';
			user_aclr	: in std_logic :='0';
			seq_sclr	: in std_logic :='0';
			result    	: out std_logic_vector(lpm_width downto 0) 
			);

end alt_dspbuilder_SAdderSub;

architecture a_SAdderSub of alt_dspbuilder_SAdderSub is

signal seqenable	: std_logic ;
signal enadff		: std_logic ;
signal dataaExt    	: std_logic_vector(lpm_width downto 0) ;
signal databExt    	: std_logic_vector(lpm_width downto 0) ;
signal aclr_i		: std_logic;

begin
	aclr_i <= aclr or user_aclr;
	
	genseq :if pipeline>0 generate

		gnoseq: if ((SequenceLength=1) and (SequenceValue="1")) generate 
			enadff <= ena;
		end generate gnoseq;
	
		gseq: if not ((SequenceLength=1) and (SequenceValue="1")) generate 
			u:alt_dspbuilder_vecseq	generic map 	(SequenceLength=>SequenceLength,SequenceValue=>SequenceValue)
					port map		(clock=>clock, ena=>ena, aclr=>aclr_i, sclr=>seq_sclr, yout=> seqenable);
			enadff <= 	seqenable and ena;	
		end generate gseq;

	end generate genseq ;

	-- Signed Extension
	dataaExt(lpm_width-1 downto 0) <= dataa(lpm_width-1 downto 0);
	dataaExt(lpm_width) <= dataa(lpm_width-1);
	databExt(lpm_width-1 downto 0) <= datab(lpm_width-1 downto 0);
	databExt(lpm_width) <= datab(lpm_width-1);
	
	nopip:if pipeline=0 generate

		genaa:if AddSubVal = AddAdd generate
			U0 : lpm_add_sub GENERIC MAP (lpm_width => lpm_width+1, lpm_direction => "ADD", lpm_type => "LPM_ADD_SUB")
							 PORT MAP 	 (dataa => dataaExt,	datab => databExt,	result => result);
		end generate genaa;

		genas:if AddSubVal = AddSub generate
			U0 : lpm_add_sub GENERIC MAP (lpm_width => lpm_width+1, lpm_direction => "SUB", lpm_type => "LPM_ADD_SUB")
							 PORT MAP 	 (dataa => dataaExt,	datab => databExt,	result => result);
		end generate genas;

		gensa:if AddSubVal = SubAdd generate
			U0 : lpm_add_sub GENERIC MAP (lpm_width => lpm_width+1, lpm_direction => "SUB", lpm_type => "LPM_ADD_SUB")
							 PORT MAP 	 (dataa => databExt,	datab => dataaExt,	result => result);
		end generate gensa;

	end generate nopip;
	
	pip:if pipeline>0 generate
		genaa:if AddSubVal = AddAdd generate
			U0 : lpm_add_sub GENERIC MAP (lpm_width => lpm_width+1, lpm_direction => "ADD", lpm_type => "LPM_ADD_SUB", lpm_pipeline => 1)
							 PORT MAP 	 (dataa => dataaExt, datab => databExt,	result => result, aclr=>aclr_i, clock=>clock, clken=>enadff);
		end generate genaa;

		genas:if AddSubVal = AddSub generate
			U0 : lpm_add_sub GENERIC MAP (lpm_width => lpm_width+1, lpm_direction => "SUB", lpm_type => "LPM_ADD_SUB", lpm_pipeline => 1)
							 PORT MAP 	 (dataa => dataaExt, datab => databExt,	result => result, aclr=>aclr_i, clock=>clock, clken=>enadff);
		end generate genas;			

		gensa:if AddSubVal = SubAdd generate
			U0 : lpm_add_sub GENERIC MAP (lpm_width => lpm_width+1, lpm_direction => "SUB", lpm_type => "LPM_ADD_SUB", lpm_pipeline => 1)
							 PORT MAP 	 (dataa => databExt, datab => dataaExt,	result => result, aclr=>aclr_i, clock=>clock, clken=>enadff);
		end generate gensa;
	end generate pip;

end a_SAdderSub;

