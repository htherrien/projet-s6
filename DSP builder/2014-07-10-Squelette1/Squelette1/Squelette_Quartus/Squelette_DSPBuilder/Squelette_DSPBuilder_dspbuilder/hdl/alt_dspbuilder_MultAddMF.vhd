--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice:  2001 Altera Corporation. All rights reserved.  Your use of Altera 
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


library ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.altmult_add;

LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_mult_add;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_MultAddMF is
	generic 	(     
					width_a					:	positive :=8;
					width_r					:	positive :=17;
					direction				:   AddSubOperator := AddAdd;
					intended_device_family	:	string :="Stratix";
					representation			:   string :="SIGNED";
					nMult					:   positive := 2;
					regstruct				: 	registerstructure :=NoRegister					
				);
	port 		( 
					dat1aa		: in std_logic_vector (width_a-1 downto 0);
					dat1ab		: in std_logic_vector (width_a-1 downto 0);
					dat2aa		: in std_logic_vector (width_a-1 downto 0);
					dat2ab		: in std_logic_vector (width_a-1 downto 0);
					dat3aa		: in std_logic_vector (width_a-1 downto 0);
					dat3ab		: in std_logic_vector (width_a-1 downto 0);
					dat4aa		: in std_logic_vector (width_a-1 downto 0);
					dat4ab		: in std_logic_vector (width_a-1 downto 0);
					clock		: in std_logic  ;
					ena			: in std_logic  ;
					aclr		: in std_logic  ;
					result		: out std_logic_vector (width_r-1 downto 0)
				);	
end alt_dspbuilder_MultAddMF;

architecture MultAddMF_synth of alt_dspbuilder_MultAddMF is

function GetFirstAdd(s: AddSubOperator) return string is
begin
	if (s=AddAdd) then
		return "ADD";
	elsif (s=AddSub) then
		return "ADD";
	else
		return "SUB";	
	end if;
end GetFirstAdd;

function GetSecAdd(s: AddSubOperator) return string is
begin
	if (s=AddAdd) then
		return "ADD";
	elsif (s=SubAdd) then
		return "ADD";
	else
		return "SUB";	
	end if;
end GetSecAdd;

function Getinput_register(s: registerstructure) return string is
begin
	if (s=InputsOnly) or (s=InputsandMultiplier) or (s=InputsandAdder) or (s=InputsMultiplierandAdder) then
		return "CLOCK0";
	else
		return "UNREGISTERED";	
	end if;
end Getinput_register;

function Getinput_aclr(s: registerstructure) return string is
begin
	if (s=InputsOnly) or (s=InputsandMultiplier) or (s=InputsandAdder)or (s=InputsMultiplierandAdder) then
		return "ACLR3";
	else
		return "UNUSED";	
	end if;
end Getinput_aclr;


function Getmultiplier_register(s: registerstructure) return string is
begin
	if (s=MultiplierOnly) or (s=MultiplierandAdder) or (s=InputsMultiplierandAdder) or (s=InputsandMultiplier) then
		return "CLOCK0";
	else
		return "UNREGISTERED";	
	end if;
end Getmultiplier_register;

function Getmultiplier_aclr(s: registerstructure) return string is
begin
	if (s=MultiplierOnly) or (s=MultiplierandAdder) or (s=InputsMultiplierandAdder) or (s=InputsandMultiplier) then
		return "ACLR3";
	else
		return "UNUSED";	
	end if;
end Getmultiplier_aclr;

function Getoutput_register(s: registerstructure) return string is
begin
	if (s=AdderOnly) or (s=InputsandAdder) or (s=InputsMultiplierandAdder) or (s=MultiplierandAdder) then
		return "CLOCK0";
	else
		return "UNREGISTERED";	
	end if;
end Getoutput_register;

function Getoutput_aclr(s: registerstructure) return string is
begin
	if (s=AdderOnly) or (s=InputsandAdder) or (s=InputsMultiplierandAdder) or (s=MultiplierandAdder) then
		return "ACLR3";
	else
		return "UNUSED";	
	end if;
end Getoutput_aclr;

signal dataa_mf	: std_logic_vector(nMult*width_a-1 downto 0);
signal datab_mf	: std_logic_vector(nMult*width_a-1 downto 0);

begin

gm2:if nMult=2 generate
	dataa_mf <= dat2aa & dat1aa;
	datab_mf <= dat2ab & dat1ab;
end generate gm2;

gm3:if nMult=3 generate
	dataa_mf <= dat3aa & dat2aa & dat1aa;
	datab_mf <= dat3ab & dat2ab & dat1ab;
end generate gm3;

gm4:if nMult=4 generate
	dataa_mf <= dat4aa & dat3aa & dat2aa & dat1aa;
	datab_mf <= dat4ab & dat3ab & dat2ab & dat1ab;
end generate gm4;


	gr:if (intended_device_family/="Arria 10" and regstruct/=NoRegister) generate
	
		ALTMULT_ADD_component : altmult_add
		GENERIC MAP (
			input_register_b2 => getinput_register(regstruct),
			input_register_a1 => getinput_register(regstruct),
			multiplier_register0 => getmultiplier_register(regstruct),
			signed_pipeline_aclr_b => "ACLR3",
			input_register_b3 => getinput_register(regstruct),
			input_register_a2 => getinput_register(regstruct),
			multiplier_register1 => getmultiplier_register(regstruct),
			addnsub_multiplier_pipeline_aclr1 => "ACLR3",
			input_register_a3 => getinput_register(regstruct),
			multiplier_register2 => getmultiplier_register(regstruct),
			signed_aclr_a => "ACLR3",
			signed_register_a => "CLOCK0",
			number_of_multipliers => nMult,
			multiplier_register3 => getmultiplier_register(regstruct),
			multiplier_aclr0 => "ACLR3",
			addnsub_multiplier_pipeline_aclr3 => "ACLR3",
			signed_aclr_b => "ACLR3",
			signed_register_b => "CLOCK0",
			lpm_type => "altmult_add",
			multiplier_aclr1 => getmultiplier_aclr(regstruct),
			input_aclr_b0 => getinput_aclr(regstruct),
			output_register => getoutput_register(regstruct),
			width_result => width_r,
			representation_a => representation,
			signed_pipeline_register_a => "CLOCK0",
			input_source_b0 => "DATAB",
			multiplier_aclr2 => getmultiplier_aclr(regstruct),
			input_aclr_b1 => getinput_aclr(regstruct),
			input_aclr_a0 => getinput_aclr(regstruct),
			multiplier3_direction => GetSecAdd(direction),
			addnsub_multiplier_register1 => "CLOCK0",
			representation_b => representation,
			signed_pipeline_register_b => "CLOCK0",
			input_source_b1 => "DATAB",
			input_source_a0 => "DATAA",
			multiplier_aclr3 => getmultiplier_aclr(regstruct),
			input_aclr_b2 => getinput_aclr(regstruct),
			input_aclr_a1 => getinput_aclr(regstruct),
			dedicated_multiplier_circuitry => "AUTO",
			input_source_b2 => "DATAB",
			input_source_a1 => "DATAA",
			input_aclr_b3 => getinput_aclr(regstruct),
			input_aclr_a2 => getinput_aclr(regstruct),
			addnsub_multiplier_register3 => "CLOCK0",
			addnsub_multiplier_aclr1 => "ACLR3",
			output_aclr => getoutput_aclr(regstruct),
			input_source_b3 => "DATAB",
			input_source_a2 => "DATAA",
			input_aclr_a3 => getinput_aclr(regstruct),
			input_source_a3 => "DATAA",
			addnsub_multiplier_aclr3 => "ACLR3",
			intended_device_family => intended_device_family,
			addnsub_multiplier_pipeline_register1 => "CLOCK0",
			width_a => width_a,
			input_register_b0 => getinput_register(regstruct),
			width_b => width_a,
			input_register_b1 => getinput_register(regstruct),
			input_register_a0 => getinput_register(regstruct),
			addnsub_multiplier_pipeline_register3 => "CLOCK0",
			multiplier1_direction => GetFirstAdd(direction),
			signed_pipeline_aclr_a => "ACLR3",
			port_addnsub1 => "PORT_UNUSED",
			port_addnsub3 => "PORT_UNUSED",
			systolic_delay1 => "UNREGISTERED",
			systolic_delay3 => "UNREGISTERED"
		)
		PORT MAP (
			dataa => dataa_mf,
			datab => datab_mf,
			clock0 => clock,
			aclr3 => aclr,
			ena0 => ena,
			result => result
		);
		
	end generate gr;

	gc:if (intended_device_family/="Arria 10" and regstruct=NoRegister) generate

		ALTMULT_ADD_component : altmult_add	GENERIC MAP (
				input_register_b2 => "UNREGISTERED",
				input_register_a1 => "UNREGISTERED",
				multiplier_register0 => "UNREGISTERED",
				signed_pipeline_aclr_b => "UNUSED",
				input_register_b3 => "UNREGISTERED",
				input_register_a2 => "UNREGISTERED",
				multiplier_register1 => "UNREGISTERED",
				addnsub_multiplier_pipeline_aclr1 => "UNUSED",
				input_register_a3 => "UNREGISTERED",
				multiplier_register2 => "UNREGISTERED",
				signed_aclr_a => "UNUSED",
				signed_register_a => "CLOCK0",
				number_of_multipliers => nMult,
				multiplier_register3 => "UNREGISTERED",
				addnsub_multiplier_pipeline_aclr3 => "UNUSED",
				signed_aclr_b => "UNUSED",
				signed_register_b => "CLOCK0",
				lpm_type => "altmult_add",
				output_register => "UNREGISTERED",
				width_result => width_r,
				representation_a => representation,
				signed_pipeline_register_a => "CLOCK0",
				input_source_b0 => "DATAB",
				multiplier3_direction => GetSecAdd(direction),
				addnsub_multiplier_register1 => "CLOCK0",
				representation_b => representation,
				signed_pipeline_register_b => "CLOCK0",
				input_source_b1 => "DATAB",
				input_source_a0 => "DATAA",
				dedicated_multiplier_circuitry => "AUTO",
				input_source_b2 => "DATAB",
				input_source_a1 => "DATAA",
				addnsub_multiplier_register3 => "CLOCK0",
				addnsub_multiplier_aclr1 => "UNUSED",
				input_source_b3 => "DATAB",
				input_source_a2 => "DATAA",
				input_source_a3 => "DATAA",
				addnsub_multiplier_aclr3 => "UNUSED",
				intended_device_family => intended_device_family,
				addnsub_multiplier_pipeline_register1 => "CLOCK0",
				width_a => width_a,
				input_register_b0 => "UNREGISTERED",
				width_b => width_a,
				input_register_b1 => "UNREGISTERED",
				input_register_a0 => "UNREGISTERED",
				addnsub_multiplier_pipeline_register3 => "CLOCK0",
				multiplier1_direction => GetFirstAdd(direction),
				signed_pipeline_aclr_a => "UNUSED",
				port_addnsub1 => "PORT_UNUSED",
				port_addnsub3 => "PORT_UNUSED",
				systolic_delay1 => "UNREGISTERED",
				systolic_delay3 => "UNREGISTERED"
			)
			PORT MAP (
				dataa => dataa_mf,
				datab => datab_mf,
				result => result
			);
	end generate gc;

	ga10:if (intended_device_family="Arria 10") generate
        altera_mult_add_i: altera_mult_add GENERIC MAP (
		selected_device_family	 =>  "Arria 10",
		lpm_type			=>  "altera_mult_add",
		lpm_hint			=>  "UNUSED",
                -- Number of multipliers
		number_of_multipliers	  	=>  nMult,
                -- Widths, register and source settings for A inputs
		width_a				=>  width_a,
		input_register_a0	=>  Getinput_register(regstruct),
		input_aclr_a0		=>  Getinput_aclr(regstruct),
		input_register_a1	=>  Getinput_register(regstruct),
		input_aclr_a1		=>  Getinput_aclr(regstruct),
		input_register_a2	=>  Getinput_register(regstruct),
		input_aclr_a2		=>  Getinput_aclr(regstruct),
		input_register_a3	=>  Getinput_register(regstruct),
		input_aclr_a3		=>  Getinput_aclr(regstruct),
		input_source_a0		=>  "DATAA",
		input_source_a1		=>  "DATAA",
		input_source_a2		=>  "DATAA",
		input_source_a3		=>  "DATAA",
                -- Widths, register and source settings for B inputs
		width_b				=>  width_a,
		input_register_b0	=>  Getinput_register(regstruct),
		input_aclr_b0		=>  Getinput_aclr(regstruct),
		input_register_b1	=>  Getinput_register(regstruct),
		input_aclr_b1		=>  Getinput_aclr(regstruct),
		input_register_b2	=>  Getinput_register(regstruct),
		input_aclr_b2		=>  Getinput_aclr(regstruct),
		input_register_b3	=>  Getinput_register(regstruct),
		input_aclr_b3		=>  Getinput_aclr(regstruct),
		input_source_b0		=>  "DATAB",
		input_source_b1		=>  "DATAB",
		input_source_b2		=>  "DATAB",
		input_source_b3		=>  "DATAB",
                -- Input signedness
		representation_a	=>  representation,
		representation_b	=>  representation,
                -- Result width and register settings
		width_result		=>  width_r,
		output_register		=>  Getoutput_register(regstruct),
		output_aclr			=>  Getoutput_aclr(regstruct),
                -- Directions of multipliers
		multiplier1_direction	  	=>  GetFirstAdd(direction),
		multiplier3_direction	  	=>  GetSecAdd(direction),
                -- Multipliers register settings
		multiplier_register0	  	=>  Getmultiplier_register(regstruct),
		multiplier_aclr0	  		=> Getmultiplier_aclr(regstruct),
		multiplier_register1	  	=>  Getmultiplier_register(regstruct),
		multiplier_aclr1	  		=>  Getmultiplier_aclr(regstruct),
		multiplier_register2	  	=>  Getmultiplier_register(regstruct),
		multiplier_aclr2	  		=>  Getmultiplier_aclr(regstruct),
		multiplier_register3	  	=>  Getmultiplier_register(regstruct),
		multiplier_aclr3	  		=>  Getmultiplier_aclr(regstruct),

                -- The following parameters should be left to default values
		port_signa			=>  "PORT_UNUSED",
		port_signb 			=>  "PORT_UNUSED",
		port_addnsub1		  		=>  "PORT_UNUSED",
		port_addnsub3		=>  "PORT_UNUSED",
		adder1_rounding		=>  "NO",
		adder3_rounding			=>  "NO",
		multiplier01_rounding		=>  "NO",
		output_rounding		=>  "NO",
		port_mult0_is_saturated		=>  "UNUSED",
		port_mult1_is_saturated		=>  "UNUSED",
		port_mult2_is_saturated		=>  "UNUSED",
		port_mult3_is_saturated		=>  "UNUSED",
		output_saturation	=>  "NO",
		port_output_is_overflow	=>  "PORT_UNUSED",
		port_chainout_sat_is_overflow			=>  "PORT_UNUSED",
		chainout_adder	=>  "NO",
		shift_mode     =>  "NO",
		accumulator	=>  "NO",
		use_sload_accum_port	=>  "NO",
		preadder_mode	=>  "SIMPLE"
                )
                PORT MAP (
                        dataa => dataa_mf,
                        datab => datab_mf,
                        clock0 => clock,
                        aclr3 => aclr,
                        ena0 => ena,
                        result => result
                );
        end generate ga10;
                        

end MultAddMF_synth;

