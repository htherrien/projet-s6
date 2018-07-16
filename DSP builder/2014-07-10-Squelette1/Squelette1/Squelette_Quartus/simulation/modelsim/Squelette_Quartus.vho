-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Full Version"

-- DATE "07/10/2014 07:38:27"

-- 
-- Device: Altera 5CGXFC5C6F27C7 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Squelette_Quartus IS
    PORT (
	Clock_50MHz : IN std_logic;
	LEDR : BUFFER std_logic_vector(9 DOWNTO 0);
	SWITCH : IN std_logic_vector(9 DOWNTO 0);
	BUTTON : IN std_logic_vector(3 DOWNTO 0);
	DAC_mode : BUFFER std_logic;
	DAC0_clock : BUFFER std_logic;
	DAC0_data : BUFFER std_logic_vector(13 DOWNTO 0);
	DAC0_wrta : BUFFER std_logic;
	DAC1_clock : BUFFER std_logic;
	DAC1_data : BUFFER std_logic_vector(13 DOWNTO 0);
	DAC1_wrta : BUFFER std_logic;
	debug_0_out : BUFFER std_logic;
	debug_1_out : BUFFER std_logic;
	debug_2_out : BUFFER std_logic
	);
END Squelette_Quartus;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_J8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[0]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[1]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[2]	=>  Location: PIN_AD13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[3]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[4]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[5]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[6]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[7]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[8]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWITCH[9]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[0]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[1]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[2]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BUTTON[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC_mode	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_clock	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[1]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[2]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[3]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[4]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[5]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[6]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[7]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[8]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[9]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[10]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[11]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[12]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_data[13]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC0_wrta	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_clock	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[0]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[1]	=>  Location: PIN_M12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[2]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[3]	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[4]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[5]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[6]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[7]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[8]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[9]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[10]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[11]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[12]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_data[13]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DAC1_wrta	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- debug_0_out	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- debug_1_out	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- debug_2_out	=>  Location: PIN_P20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock_50MHz	=>  Location: PIN_R20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Squelette_Quartus IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clock_50MHz : std_logic;
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_SWITCH : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_BUTTON : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_DAC_mode : std_logic;
SIGNAL ww_DAC0_clock : std_logic;
SIGNAL ww_DAC0_data : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_DAC0_wrta : std_logic;
SIGNAL ww_DAC1_clock : std_logic;
SIGNAL ww_DAC1_data : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_DAC1_wrta : std_logic;
SIGNAL ww_debug_0_out : std_logic;
SIGNAL ww_debug_1_out : std_logic;
SIGNAL ww_debug_2_out : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_AX_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_AY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_resulta\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~9\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~10\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~11\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~12\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~13\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~14\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~15\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~16\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~17\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~18\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~19\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~20\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~21\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~22\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~23\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~24\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~25\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~26\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~27\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~28\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~29\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~30\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~31\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~32\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~33\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~34\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~35\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~36\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~37\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~38\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~39\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~40\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~41\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~42\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~43\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~44\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~45\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~46\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~47\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~48\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~49\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~50\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~51\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~52\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~53\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~54\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~55\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~56\ : std_logic;
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~57\ : std_logic;
SIGNAL \SWITCH[0]~input_o\ : std_logic;
SIGNAL \SWITCH[1]~input_o\ : std_logic;
SIGNAL \SWITCH[2]~input_o\ : std_logic;
SIGNAL \SWITCH[3]~input_o\ : std_logic;
SIGNAL \SWITCH[4]~input_o\ : std_logic;
SIGNAL \SWITCH[5]~input_o\ : std_logic;
SIGNAL \SWITCH[6]~input_o\ : std_logic;
SIGNAL \SWITCH[7]~input_o\ : std_logic;
SIGNAL \SWITCH[8]~input_o\ : std_logic;
SIGNAL \SWITCH[9]~input_o\ : std_logic;
SIGNAL \BUTTON[0]~input_o\ : std_logic;
SIGNAL \BUTTON[1]~input_o\ : std_logic;
SIGNAL \BUTTON[2]~input_o\ : std_logic;
SIGNAL \BUTTON[3]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Clock_50MHz~input_o\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\ : std_logic;
SIGNAL \counter_heartbeat[0]~0_combout\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN5\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \Clock_50MHz~inputCLKENA0_outclk\ : std_logic;
SIGNAL \counter_reset[0]~1_combout\ : std_logic;
SIGNAL \Add1~37_sumout\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \counter_reset[10]~0_combout\ : std_logic;
SIGNAL \Add2~13_sumout\ : std_logic;
SIGNAL \Add2~18\ : std_logic;
SIGNAL \Add2~5_sumout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Add2~10\ : std_logic;
SIGNAL \Add2~1_sumout\ : std_logic;
SIGNAL \counter_bitPeriod[7]~DUPLICATE_q\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Add2~6\ : std_logic;
SIGNAL \Add2~29_sumout\ : std_logic;
SIGNAL \Add2~30\ : std_logic;
SIGNAL \Add2~25_sumout\ : std_logic;
SIGNAL \Add2~26\ : std_logic;
SIGNAL \Add2~21_sumout\ : std_logic;
SIGNAL \Add2~22\ : std_logic;
SIGNAL \Add2~9_sumout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Add2~14\ : std_logic;
SIGNAL \Add2~17_sumout\ : std_logic;
SIGNAL \counter_bitPeriod[7]~_wirecell_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \counter_bitPeriod[4]~0_combout\ : std_logic;
SIGNAL \pseudoRandomNumberGenerator[3]~5_combout\ : std_logic;
SIGNAL \pseudoRandomNumberGenerator[5]~4_combout\ : std_logic;
SIGNAL \pseudoRandomNumberGenerator[6]~3_combout\ : std_logic;
SIGNAL \pseudoRandomNumberGenerator[7]~2_combout\ : std_logic;
SIGNAL \pseudoRandomNumberGenerator[8]~1_combout\ : std_logic;
SIGNAL \pseudoRandomNumberGenerator[14]~0_combout\ : std_logic;
SIGNAL \bit_a_transmettre~0_combout\ : std_logic;
SIGNAL \bit_a_transmettre~q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[1]~_wirecell_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~0_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[3]~_wirecell_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~1_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[5]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[5]~_wirecell_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~2_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[8]~_wirecell_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~4_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~5_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~6_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~7_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~8_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result~3_combout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~2\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~3\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~6\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~7\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~10\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~11\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~14\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~15\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~18\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~19\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~22\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~23\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~26\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~27\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~30\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~31\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~34\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~35\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~38\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~39\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~42\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~43\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~46\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~47\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~50\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~51\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~53_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~9_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~8_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[12]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~7_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[11]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~6_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[10]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~5_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[9]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~4_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[8]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~29_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~3_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[6]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~2_combout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~17_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~1_combout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~9_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result~0_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result[1]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~1_sumout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \bitclk_i~q\ : std_logic;
SIGNAL \pll_inst|altera_pll_i|outclk_wire\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|result\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \dspbuilder_inst|delay|DelayWithInit|result\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\ : std_logic_vector(32 DOWNTO 0);
SIGNAL \pll_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(3 DOWNTO 0);
SIGNAL pseudoRandomNumberGenerator : std_logic_vector(15 DOWNTO 0);
SIGNAL counter_reset : std_logic_vector(10 DOWNTO 0);
SIGNAL counter_heartbeat : std_logic_vector(21 DOWNTO 0);
SIGNAL counter_bitPeriod : std_logic_vector(7 DOWNTO 0);
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[13]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[12]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[11]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[10]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[9]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[8]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[6]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[5]~DUPLICATE_q\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\ : std_logic;
SIGNAL ALT_INV_counter_heartbeat : std_logic_vector(21 DOWNTO 0);
SIGNAL ALT_INV_pseudoRandomNumberGenerator : std_logic_vector(15 DOWNTO 2);
SIGNAL ALT_INV_counter_reset : std_logic_vector(10 DOWNTO 0);
SIGNAL \ALT_INV_Mux8~2_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\ : std_logic_vector(13 DOWNTO 1);
SIGNAL \ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \ALT_INV_bit_a_transmettre~q\ : std_logic;
SIGNAL \ALT_INV_bitclk_i~q\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL ALT_INV_counter_bitPeriod : std_logic_vector(7 DOWNTO 0);
SIGNAL \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\ : std_logic_vector(29 DOWNTO 16);
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~53_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~49_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~45_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~41_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~37_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~33_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~25_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~21_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~13_sumout\ : std_logic;
SIGNAL \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~5_sumout\ : std_logic;

BEGIN

ww_Clock_50MHz <= Clock_50MHz;
LEDR <= ww_LEDR;
ww_SWITCH <= SWITCH;
ww_BUTTON <= BUTTON;
DAC_mode <= ww_DAC_mode;
DAC0_clock <= ww_DAC0_clock;
DAC0_data <= ww_DAC0_data;
DAC0_wrta <= ww_DAC0_wrta;
DAC1_clock <= ww_DAC1_clock;
DAC1_data <= ww_DAC1_data;
DAC1_wrta <= ww_DAC1_wrta;
debug_0_out <= ww_debug_0_out;
debug_1_out <= ww_debug_1_out;
debug_2_out <= ww_debug_2_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_AX_bus\ <= (NOT \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\ & NOT \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\ & NOT 
\dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\ & NOT \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\ & NOT \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\ & NOT 
\dspbuilder_inst|delay|DelayWithInit|result[12]~DUPLICATE_q\ & NOT \dspbuilder_inst|delay|DelayWithInit|result[11]~DUPLICATE_q\ & NOT \dspbuilder_inst|delay|DelayWithInit|result[10]~DUPLICATE_q\ & NOT 
\dspbuilder_inst|delay|DelayWithInit|result[9]~DUPLICATE_q\ & NOT \dspbuilder_inst|delay|DelayWithInit|result[8]~DUPLICATE_q\ & \dspbuilder_inst|delay|DelayWithInit|result\(7) & NOT \dspbuilder_inst|delay|DelayWithInit|result[6]~DUPLICATE_q\ & NOT 
\dspbuilder_inst|delay|DelayWithInit|result\(5) & \dspbuilder_inst|delay|DelayWithInit|result\(4) & NOT \dspbuilder_inst|delay|DelayWithInit|result\(3) & \dspbuilder_inst|delay|DelayWithInit|result\(2) & NOT 
\dspbuilder_inst|delay|DelayWithInit|result[1]~DUPLICATE_q\ & \dspbuilder_inst|delay|DelayWithInit|result\(0));

\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_AY_bus\ <= (gnd & vcc & vcc & vcc & vcc & gnd & gnd & vcc & vcc & gnd & gnd & gnd & gnd & gnd & vcc & vcc & vcc & vcc);

\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_resulta\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(0);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~9\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(1);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~10\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(2);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~11\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(3);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~12\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(4);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~13\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(5);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~14\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(6);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~15\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(7);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~16\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(8);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~17\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(9);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~18\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(10);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~19\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(11);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~20\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(12);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~21\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(13);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~22\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(14);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~23\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(15);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(16) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(16);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(17) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(17);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(18) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(18);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(19) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(19);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(20) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(20);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(21) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(21);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(22) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(22);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(23) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(23);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(24) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(24);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(25) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(25);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(26) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(26);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(27) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(27);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(28) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(28);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(29) <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(29);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~24\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(30);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~25\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(31);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~26\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(32);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~27\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(33);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~28\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(34);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~29\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(35);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~30\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(36);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~31\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(37);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~32\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(38);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~33\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(39);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~34\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(40);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~35\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(41);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~36\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(42);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~37\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(43);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~38\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(44);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~39\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(45);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~40\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(46);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~41\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(47);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~42\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(48);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~43\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(49);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~44\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(50);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~45\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(51);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~46\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(52);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~47\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(53);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~48\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(54);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~49\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(55);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~50\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(56);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~51\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(57);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~52\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(58);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~53\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(59);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~54\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(60);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~55\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(61);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~56\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(62);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~57\ <= \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\(63);

\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & \Clock_50MHz~input_o\ & gnd & gnd);

\pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\
& \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\
& \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN5\ <= \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(5);
\pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);

\pll_inst|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[13]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[12]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[12]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[11]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[11]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[10]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[10]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[9]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[9]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[8]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[8]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[6]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[6]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[5]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[5]~DUPLICATE_q\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[1]~DUPLICATE_q\ <= NOT \dspbuilder_inst|delay|DelayWithInit|result[1]~DUPLICATE_q\;
\ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\ <= NOT \counter_bitPeriod[7]~DUPLICATE_q\;
ALT_INV_counter_heartbeat(0) <= NOT counter_heartbeat(0);
ALT_INV_counter_heartbeat(1) <= NOT counter_heartbeat(1);
ALT_INV_counter_heartbeat(2) <= NOT counter_heartbeat(2);
ALT_INV_counter_heartbeat(3) <= NOT counter_heartbeat(3);
ALT_INV_counter_heartbeat(4) <= NOT counter_heartbeat(4);
ALT_INV_counter_heartbeat(5) <= NOT counter_heartbeat(5);
ALT_INV_counter_heartbeat(6) <= NOT counter_heartbeat(6);
ALT_INV_counter_heartbeat(7) <= NOT counter_heartbeat(7);
ALT_INV_counter_heartbeat(8) <= NOT counter_heartbeat(8);
ALT_INV_pseudoRandomNumberGenerator(2) <= NOT pseudoRandomNumberGenerator(2);
ALT_INV_counter_heartbeat(9) <= NOT counter_heartbeat(9);
ALT_INV_counter_reset(0) <= NOT counter_reset(0);
ALT_INV_counter_reset(1) <= NOT counter_reset(1);
ALT_INV_counter_heartbeat(10) <= NOT counter_heartbeat(10);
ALT_INV_pseudoRandomNumberGenerator(4) <= NOT pseudoRandomNumberGenerator(4);
ALT_INV_counter_reset(2) <= NOT counter_reset(2);
ALT_INV_counter_heartbeat(11) <= NOT counter_heartbeat(11);
ALT_INV_pseudoRandomNumberGenerator(5) <= NOT pseudoRandomNumberGenerator(5);
ALT_INV_counter_reset(3) <= NOT counter_reset(3);
ALT_INV_counter_heartbeat(12) <= NOT counter_heartbeat(12);
ALT_INV_pseudoRandomNumberGenerator(6) <= NOT pseudoRandomNumberGenerator(6);
ALT_INV_counter_reset(4) <= NOT counter_reset(4);
ALT_INV_counter_heartbeat(13) <= NOT counter_heartbeat(13);
ALT_INV_pseudoRandomNumberGenerator(7) <= NOT pseudoRandomNumberGenerator(7);
ALT_INV_counter_reset(5) <= NOT counter_reset(5);
ALT_INV_counter_heartbeat(14) <= NOT counter_heartbeat(14);
ALT_INV_counter_reset(6) <= NOT counter_reset(6);
ALT_INV_counter_heartbeat(15) <= NOT counter_heartbeat(15);
ALT_INV_counter_reset(7) <= NOT counter_reset(7);
ALT_INV_counter_heartbeat(16) <= NOT counter_heartbeat(16);
ALT_INV_counter_reset(8) <= NOT counter_reset(8);
ALT_INV_counter_heartbeat(17) <= NOT counter_heartbeat(17);
ALT_INV_counter_reset(9) <= NOT counter_reset(9);
ALT_INV_counter_heartbeat(18) <= NOT counter_heartbeat(18);
ALT_INV_counter_heartbeat(19) <= NOT counter_heartbeat(19);
ALT_INV_pseudoRandomNumberGenerator(13) <= NOT pseudoRandomNumberGenerator(13);
ALT_INV_counter_heartbeat(20) <= NOT counter_heartbeat(20);
\ALT_INV_Mux8~2_combout\ <= NOT \Mux8~2_combout\;
ALT_INV_counter_reset(10) <= NOT counter_reset(10);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(13) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(13);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(12) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(12);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(11) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(11);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(10) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(10);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(9) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(9);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(8) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(8);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(6) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(6);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(5) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(5);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(3) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(3);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(1) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(1);
ALT_INV_pseudoRandomNumberGenerator(15) <= NOT pseudoRandomNumberGenerator(15);
\ALT_INV_Mux8~0_combout\ <= NOT \Mux8~0_combout\;
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(13) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(13);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(12) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(12);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(11) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(11);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(10) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(10);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(9) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(9);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(7) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(7);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(6) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(6);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(4) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(4);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(2) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(2);
\ALT_INV_bit_a_transmettre~q\ <= NOT \bit_a_transmettre~q\;
\ALT_INV_bitclk_i~q\ <= NOT \bitclk_i~q\;
ALT_INV_counter_heartbeat(21) <= NOT counter_heartbeat(21);
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(7) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(7);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(4) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(4);
\dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(2) <= NOT \dspbuilder_inst|delay|DelayWithInit|result\(2);
ALT_INV_counter_bitPeriod(3) <= NOT counter_bitPeriod(3);
ALT_INV_counter_bitPeriod(4) <= NOT counter_bitPeriod(4);
ALT_INV_counter_bitPeriod(5) <= NOT counter_bitPeriod(5);
ALT_INV_counter_bitPeriod(1) <= NOT counter_bitPeriod(1);
ALT_INV_counter_bitPeriod(0) <= NOT counter_bitPeriod(0);
ALT_INV_counter_bitPeriod(6) <= NOT counter_bitPeriod(6);
ALT_INV_counter_bitPeriod(2) <= NOT counter_bitPeriod(2);
ALT_INV_counter_bitPeriod(7) <= NOT counter_bitPeriod(7);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(8) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(8);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(5) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(5);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(3) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(3);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(1) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(1);
\dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(0) <= NOT \dspbuilder_inst|delay1|DelayWithInit|result\(0);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(29) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(29);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(28) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(28);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(27) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(27);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(26) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(26);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(25) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(25);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(24) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(24);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(23) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(23);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(22) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(22);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(21) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(21);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(20) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(20);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(19) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(19);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(18) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(18);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(17) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(17);
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(16) <= NOT \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(16);
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~53_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~53_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~49_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~45_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~41_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~37_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~33_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~25_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~21_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~13_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13_sumout\;
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~5_sumout\ <= NOT \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5_sumout\;

-- Location: IOOBUF_X14_Y61_N53
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X15_Y61_N36
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X15_Y61_N53
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X14_Y61_N36
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X14_Y61_N19
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X12_Y61_N53
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X12_Y61_N2
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X14_Y61_N2
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X12_Y61_N36
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X12_Y61_N19
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => counter_heartbeat(21),
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOOBUF_X64_Y61_N53
\DAC_mode~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_DAC_mode);

-- Location: IOOBUF_X57_Y61_N53
\DAC0_clock~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	devoe => ww_devoe,
	o => ww_DAC0_clock);

-- Location: IOOBUF_X40_Y61_N76
\DAC0_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~1_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(0));

-- Location: IOOBUF_X40_Y61_N93
\DAC0_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(1));

-- Location: IOOBUF_X46_Y61_N36
\DAC0_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~9_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(2));

-- Location: IOOBUF_X46_Y61_N53
\DAC0_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(3));

-- Location: IOOBUF_X44_Y61_N36
\DAC0_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~17_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(4));

-- Location: IOOBUF_X44_Y61_N53
\DAC0_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(5));

-- Location: IOOBUF_X36_Y61_N36
\DAC0_data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(6));

-- Location: IOOBUF_X36_Y61_N53
\DAC0_data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~29_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(7));

-- Location: IOOBUF_X42_Y61_N36
\DAC0_data[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(8));

-- Location: IOOBUF_X42_Y61_N53
\DAC0_data[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(9));

-- Location: IOOBUF_X61_Y61_N36
\DAC0_data[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(10));

-- Location: IOOBUF_X61_Y61_N53
\DAC0_data[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(11));

-- Location: IOOBUF_X50_Y61_N36
\DAC0_data[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(12));

-- Location: IOOBUF_X50_Y61_N53
\DAC0_data[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~53_sumout\,
	devoe => ww_devoe,
	o => ww_DAC0_data(13));

-- Location: IOOBUF_X64_Y61_N36
\DAC0_wrta~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	devoe => ww_devoe,
	o => ww_DAC0_wrta);

-- Location: IOOBUF_X57_Y61_N36
\DAC1_clock~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_clock);

-- Location: IOOBUF_X42_Y61_N2
\DAC1_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(0));

-- Location: IOOBUF_X42_Y61_N19
\DAC1_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(1));

-- Location: IOOBUF_X34_Y61_N2
\DAC1_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(2));

-- Location: IOOBUF_X34_Y61_N19
\DAC1_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(3));

-- Location: IOOBUF_X64_Y61_N2
\DAC1_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(4));

-- Location: IOOBUF_X64_Y61_N19
\DAC1_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(5));

-- Location: IOOBUF_X50_Y61_N2
\DAC1_data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(6));

-- Location: IOOBUF_X50_Y61_N19
\DAC1_data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(7));

-- Location: IOOBUF_X66_Y61_N2
\DAC1_data[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(8));

-- Location: IOOBUF_X66_Y61_N19
\DAC1_data[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(9));

-- Location: IOOBUF_X57_Y61_N2
\DAC1_data[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(10));

-- Location: IOOBUF_X57_Y61_N19
\DAC1_data[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(11));

-- Location: IOOBUF_X61_Y61_N2
\DAC1_data[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(12));

-- Location: IOOBUF_X61_Y61_N19
\DAC1_data[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_data(13));

-- Location: IOOBUF_X36_Y61_N2
\DAC1_wrta~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_DAC1_wrta);

-- Location: IOOBUF_X68_Y32_N62
\debug_0_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bitclk_i~q\,
	devoe => ww_devoe,
	o => ww_debug_0_out);

-- Location: IOOBUF_X68_Y14_N62
\debug_1_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bit_a_transmettre~q\,
	devoe => ww_devoe,
	o => ww_debug_1_out);

-- Location: IOOBUF_X68_Y22_N62
\debug_2_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bit_a_transmettre~q\,
	devoe => ww_devoe,
	o => ww_debug_2_out);

-- Location: IOIBUF_X68_Y22_N44
\Clock_50MHz~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock_50MHz,
	o => \Clock_50MHz~input_o\);

-- Location: PLLREFCLKSELECT_X68_Y7_N0
\pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_2",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: FRACTIONALPLL_X68_Y1_N0
\pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "500.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 10,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 10,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
	fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \pll_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => GND,
	refclkin => \pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \pll_inst|altera_pll_i|fboutclk_wire\(0),
	tclk => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X68_Y5_N0
\pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
	fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X68_Y6_N1
\pll_inst|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 25,
	dprio0_cnt_lo_div => 25,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "10.0 mhz",
	phase_shift => "0 ps",
	fractional_pll_index => 0,
	output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \pll_inst|altera_pll_i|general[2].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll_inst|altera_pll_i|outclk_wire\(2));

-- Location: CLKCTRL_G4
\pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll_inst|altera_pll_i|outclk_wire\(2),
	outclk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\);

-- Location: LABCELL_X18_Y60_N0
\counter_heartbeat[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_heartbeat[0]~0_combout\ = ( !counter_heartbeat(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_counter_heartbeat(0),
	combout => \counter_heartbeat[0]~0_combout\);

-- Location: FF_X18_Y60_N1
\counter_heartbeat[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \counter_heartbeat[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(0));

-- Location: LABCELL_X18_Y60_N30
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( counter_heartbeat(1) ) + ( counter_heartbeat(0) ) + ( !VCC ))
-- \Add0~82\ = CARRY(( counter_heartbeat(1) ) + ( counter_heartbeat(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_counter_heartbeat(0),
	datad => ALT_INV_counter_heartbeat(1),
	cin => GND,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X18_Y60_N32
\counter_heartbeat[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~81_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(1));

-- Location: LABCELL_X18_Y60_N33
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( counter_heartbeat(2) ) + ( GND ) + ( \Add0~82\ ))
-- \Add0~78\ = CARRY(( counter_heartbeat(2) ) + ( GND ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(2),
	cin => \Add0~82\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X18_Y60_N35
\counter_heartbeat[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~77_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(2));

-- Location: LABCELL_X18_Y60_N36
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( counter_heartbeat(3) ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~74\ = CARRY(( counter_heartbeat(3) ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(3),
	cin => \Add0~78\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X18_Y60_N38
\counter_heartbeat[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~73_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(3));

-- Location: LABCELL_X18_Y60_N39
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( counter_heartbeat(4) ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( counter_heartbeat(4) ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(4),
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X18_Y60_N41
\counter_heartbeat[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~69_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(4));

-- Location: LABCELL_X18_Y60_N42
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( counter_heartbeat(5) ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~66\ = CARRY(( counter_heartbeat(5) ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(5),
	cin => \Add0~70\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X18_Y60_N44
\counter_heartbeat[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~65_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(5));

-- Location: LABCELL_X18_Y60_N45
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( counter_heartbeat(6) ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~62\ = CARRY(( counter_heartbeat(6) ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(6),
	cin => \Add0~66\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X18_Y60_N47
\counter_heartbeat[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~61_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(6));

-- Location: LABCELL_X18_Y60_N48
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( counter_heartbeat(7) ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( counter_heartbeat(7) ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(7),
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X18_Y60_N50
\counter_heartbeat[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~57_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(7));

-- Location: LABCELL_X18_Y60_N51
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( counter_heartbeat(8) ) + ( GND ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( counter_heartbeat(8) ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(8),
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X18_Y60_N53
\counter_heartbeat[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~53_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(8));

-- Location: LABCELL_X18_Y60_N54
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( counter_heartbeat(9) ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~50\ = CARRY(( counter_heartbeat(9) ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(9),
	cin => \Add0~54\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X18_Y60_N56
\counter_heartbeat[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~49_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(9));

-- Location: LABCELL_X18_Y60_N57
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( counter_heartbeat(10) ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~46\ = CARRY(( counter_heartbeat(10) ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(10),
	cin => \Add0~50\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X18_Y60_N59
\counter_heartbeat[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~45_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(10));

-- Location: LABCELL_X18_Y59_N0
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( counter_heartbeat(11) ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~42\ = CARRY(( counter_heartbeat(11) ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(11),
	cin => \Add0~46\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X18_Y59_N2
\counter_heartbeat[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~41_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(11));

-- Location: LABCELL_X18_Y59_N3
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( counter_heartbeat(12) ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~38\ = CARRY(( counter_heartbeat(12) ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(12),
	cin => \Add0~42\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X18_Y59_N5
\counter_heartbeat[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~37_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(12));

-- Location: LABCELL_X18_Y59_N6
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( counter_heartbeat(13) ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( counter_heartbeat(13) ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(13),
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X18_Y59_N8
\counter_heartbeat[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(13));

-- Location: LABCELL_X18_Y59_N9
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( counter_heartbeat(14) ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~30\ = CARRY(( counter_heartbeat(14) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(14),
	cin => \Add0~34\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X18_Y59_N11
\counter_heartbeat[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(14));

-- Location: LABCELL_X18_Y59_N12
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( counter_heartbeat(15) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~26\ = CARRY(( counter_heartbeat(15) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(15),
	cin => \Add0~30\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X18_Y59_N14
\counter_heartbeat[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(15));

-- Location: LABCELL_X18_Y59_N15
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( counter_heartbeat(16) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( counter_heartbeat(16) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(16),
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X18_Y59_N17
\counter_heartbeat[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(16));

-- Location: LABCELL_X18_Y59_N18
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( counter_heartbeat(17) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( counter_heartbeat(17) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(17),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X18_Y59_N20
\counter_heartbeat[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(17));

-- Location: LABCELL_X18_Y59_N21
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( counter_heartbeat(18) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( counter_heartbeat(18) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(18),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X18_Y59_N23
\counter_heartbeat[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(18));

-- Location: LABCELL_X18_Y59_N24
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( counter_heartbeat(19) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( counter_heartbeat(19) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(19),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X18_Y59_N26
\counter_heartbeat[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(19));

-- Location: LABCELL_X18_Y59_N27
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( counter_heartbeat(20) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~6\ = CARRY(( counter_heartbeat(20) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(20),
	cin => \Add0~10\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X18_Y59_N29
\counter_heartbeat[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(20));

-- Location: LABCELL_X18_Y59_N30
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( counter_heartbeat(21) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_heartbeat(21),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\);

-- Location: FF_X18_Y59_N31
\counter_heartbeat[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[2]~CLKENA0_outclk\,
	d => \Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_heartbeat(21));

-- Location: PLLOUTPUTCOUNTER_X68_Y5_N1
\pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 2,
	dprio0_cnt_lo_div => 2,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "125.0 mhz",
	phase_shift => "0 ps",
	fractional_pll_index => 0,
	output_counter_index => 5)
-- pragma translate_on
PORT MAP (
	nen0 => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN5\,
	tclk0 => \pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G7
\pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll_inst|altera_pll_i|outclk_wire\(0),
	outclk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: CLKCTRL_G10
\Clock_50MHz~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \Clock_50MHz~input_o\,
	outclk => \Clock_50MHz~inputCLKENA0_outclk\);

-- Location: LABCELL_X54_Y42_N57
\counter_reset[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_reset[0]~1_combout\ = ( !counter_reset(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_counter_reset(0),
	combout => \counter_reset[0]~1_combout\);

-- Location: FF_X54_Y42_N58
\counter_reset[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \counter_reset[0]~1_combout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(0));

-- Location: LABCELL_X54_Y42_N0
\Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~37_sumout\ = SUM(( counter_reset(1) ) + ( counter_reset(0) ) + ( !VCC ))
-- \Add1~38\ = CARRY(( counter_reset(1) ) + ( counter_reset(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_counter_reset(0),
	datad => ALT_INV_counter_reset(1),
	cin => GND,
	sumout => \Add1~37_sumout\,
	cout => \Add1~38\);

-- Location: FF_X54_Y42_N2
\counter_reset[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~37_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(1));

-- Location: LABCELL_X54_Y42_N3
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( counter_reset(2) ) + ( GND ) + ( \Add1~38\ ))
-- \Add1~34\ = CARRY(( counter_reset(2) ) + ( GND ) + ( \Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(2),
	cin => \Add1~38\,
	sumout => \Add1~33_sumout\,
	cout => \Add1~34\);

-- Location: FF_X54_Y42_N5
\counter_reset[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~33_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(2));

-- Location: LABCELL_X54_Y42_N6
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( counter_reset(3) ) + ( GND ) + ( \Add1~34\ ))
-- \Add1~30\ = CARRY(( counter_reset(3) ) + ( GND ) + ( \Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(3),
	cin => \Add1~34\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\);

-- Location: FF_X54_Y42_N8
\counter_reset[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~29_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(3));

-- Location: LABCELL_X54_Y42_N9
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( counter_reset(4) ) + ( GND ) + ( \Add1~30\ ))
-- \Add1~26\ = CARRY(( counter_reset(4) ) + ( GND ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(4),
	cin => \Add1~30\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: FF_X54_Y42_N11
\counter_reset[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~25_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(4));

-- Location: LABCELL_X54_Y42_N12
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( counter_reset(5) ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~22\ = CARRY(( counter_reset(5) ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(5),
	cin => \Add1~26\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: FF_X54_Y42_N14
\counter_reset[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~21_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(5));

-- Location: LABCELL_X54_Y42_N15
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( counter_reset(6) ) + ( GND ) + ( \Add1~22\ ))
-- \Add1~18\ = CARRY(( counter_reset(6) ) + ( GND ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(6),
	cin => \Add1~22\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: FF_X54_Y42_N17
\counter_reset[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~17_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(6));

-- Location: LABCELL_X54_Y42_N18
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( counter_reset(7) ) + ( GND ) + ( \Add1~18\ ))
-- \Add1~14\ = CARRY(( counter_reset(7) ) + ( GND ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(7),
	cin => \Add1~18\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: FF_X54_Y42_N20
\counter_reset[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~13_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(7));

-- Location: LABCELL_X54_Y42_N21
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( counter_reset(8) ) + ( GND ) + ( \Add1~14\ ))
-- \Add1~10\ = CARRY(( counter_reset(8) ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(8),
	cin => \Add1~14\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: FF_X54_Y42_N23
\counter_reset[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~9_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(8));

-- Location: LABCELL_X54_Y42_N24
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( counter_reset(9) ) + ( GND ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( counter_reset(9) ) + ( GND ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_reset(9),
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: FF_X54_Y42_N26
\counter_reset[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \Add1~5_sumout\,
	ena => ALT_INV_counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(9));

-- Location: LABCELL_X54_Y42_N27
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( counter_reset(10) ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_counter_reset(10),
	cin => \Add1~6\,
	sumout => \Add1~1_sumout\);

-- Location: LABCELL_X53_Y42_N24
\counter_reset[10]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_reset[10]~0_combout\ = ( counter_reset(10) & ( \Add1~1_sumout\ ) ) # ( !counter_reset(10) & ( \Add1~1_sumout\ ) ) # ( counter_reset(10) & ( !\Add1~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_counter_reset(10),
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \counter_reset[10]~0_combout\);

-- Location: FF_X53_Y42_N26
\counter_reset[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock_50MHz~inputCLKENA0_outclk\,
	d => \counter_reset[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_reset(10));

-- Location: LABCELL_X65_Y30_N30
\Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~13_sumout\ = SUM(( counter_bitPeriod(0) ) + ( VCC ) + ( !VCC ))
-- \Add2~14\ = CARRY(( counter_bitPeriod(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(0),
	cin => GND,
	sumout => \Add2~13_sumout\,
	cout => \Add2~14\);

-- Location: LABCELL_X65_Y30_N33
\Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~17_sumout\ = SUM(( counter_bitPeriod(1) ) + ( GND ) + ( \Add2~14\ ))
-- \Add2~18\ = CARRY(( counter_bitPeriod(1) ) + ( GND ) + ( \Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(1),
	cin => \Add2~14\,
	sumout => \Add2~17_sumout\,
	cout => \Add2~18\);

-- Location: LABCELL_X65_Y30_N36
\Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~5_sumout\ = SUM(( counter_bitPeriod(2) ) + ( GND ) + ( \Add2~18\ ))
-- \Add2~6\ = CARRY(( counter_bitPeriod(2) ) + ( GND ) + ( \Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(2),
	cin => \Add2~18\,
	sumout => \Add2~5_sumout\,
	cout => \Add2~6\);

-- Location: LABCELL_X65_Y30_N0
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \counter_bitPeriod[7]~DUPLICATE_q\ & ( !counter_bitPeriod(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter_bitPeriod(6),
	dataf => \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\,
	combout => \Mux0~0_combout\);

-- Location: FF_X65_Y30_N52
\counter_bitPeriod[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~1_sumout\,
	asdata => \Mux0~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(7));

-- Location: LABCELL_X65_Y30_N48
\Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~9_sumout\ = SUM(( counter_bitPeriod(6) ) + ( GND ) + ( \Add2~22\ ))
-- \Add2~10\ = CARRY(( counter_bitPeriod(6) ) + ( GND ) + ( \Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(6),
	cin => \Add2~22\,
	sumout => \Add2~9_sumout\,
	cout => \Add2~10\);

-- Location: LABCELL_X65_Y30_N51
\Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~1_sumout\ = SUM(( counter_bitPeriod(7) ) + ( GND ) + ( \Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(7),
	cin => \Add2~10\,
	sumout => \Add2~1_sumout\);

-- Location: FF_X65_Y30_N53
\counter_bitPeriod[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~1_sumout\,
	asdata => \Mux0~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_bitPeriod[7]~DUPLICATE_q\);

-- Location: LABCELL_X65_Y30_N27
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( counter_bitPeriod(6) & ( !\counter_bitPeriod[7]~DUPLICATE_q\ ) ) # ( !counter_bitPeriod(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\,
	dataf => ALT_INV_counter_bitPeriod(6),
	combout => \Mux2~0_combout\);

-- Location: FF_X65_Y30_N37
\counter_bitPeriod[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~5_sumout\,
	asdata => \Mux2~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(2));

-- Location: LABCELL_X65_Y30_N39
\Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~29_sumout\ = SUM(( counter_bitPeriod(3) ) + ( GND ) + ( \Add2~6\ ))
-- \Add2~30\ = CARRY(( counter_bitPeriod(3) ) + ( GND ) + ( \Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(3),
	cin => \Add2~6\,
	sumout => \Add2~29_sumout\,
	cout => \Add2~30\);

-- Location: FF_X65_Y30_N40
\counter_bitPeriod[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~29_sumout\,
	asdata => \Mux2~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(3));

-- Location: LABCELL_X65_Y30_N42
\Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~25_sumout\ = SUM(( counter_bitPeriod(4) ) + ( GND ) + ( \Add2~30\ ))
-- \Add2~26\ = CARRY(( counter_bitPeriod(4) ) + ( GND ) + ( \Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(4),
	cin => \Add2~30\,
	sumout => \Add2~25_sumout\,
	cout => \Add2~26\);

-- Location: FF_X65_Y30_N44
\counter_bitPeriod[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~25_sumout\,
	asdata => \Mux2~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(4));

-- Location: LABCELL_X65_Y30_N45
\Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~21_sumout\ = SUM(( counter_bitPeriod(5) ) + ( GND ) + ( \Add2~26\ ))
-- \Add2~22\ = CARRY(( counter_bitPeriod(5) ) + ( GND ) + ( \Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_counter_bitPeriod(5),
	cin => \Add2~26\,
	sumout => \Add2~21_sumout\,
	cout => \Add2~22\);

-- Location: FF_X65_Y30_N47
\counter_bitPeriod[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~21_sumout\,
	asdata => \Mux2~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(5));

-- Location: LABCELL_X65_Y30_N9
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( counter_bitPeriod(6) & ( !\counter_bitPeriod[7]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\,
	dataf => ALT_INV_counter_bitPeriod(6),
	combout => \Mux1~0_combout\);

-- Location: FF_X65_Y30_N50
\counter_bitPeriod[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~9_sumout\,
	asdata => \Mux1~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(6));

-- Location: LABCELL_X65_Y30_N3
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( !\counter_bitPeriod[7]~DUPLICATE_q\ & ( !counter_bitPeriod(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter_bitPeriod(6),
	dataf => \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\,
	combout => \Mux7~0_combout\);

-- Location: FF_X65_Y30_N32
\counter_bitPeriod[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~13_sumout\,
	asdata => \Mux7~0_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(0));

-- Location: LABCELL_X65_Y30_N6
\counter_bitPeriod[7]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_bitPeriod[7]~_wirecell_combout\ = !\counter_bitPeriod[7]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\,
	combout => \counter_bitPeriod[7]~_wirecell_combout\);

-- Location: FF_X65_Y30_N35
\counter_bitPeriod[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add2~17_sumout\,
	asdata => \counter_bitPeriod[7]~_wirecell_combout\,
	sload => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter_bitPeriod(1));

-- Location: LABCELL_X65_Y30_N21
\Mux8~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~2_combout\ = ( counter_bitPeriod(4) & ( (counter_bitPeriod(3) & counter_bitPeriod(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter_bitPeriod(3),
	datac => ALT_INV_counter_bitPeriod(5),
	dataf => ALT_INV_counter_bitPeriod(4),
	combout => \Mux8~2_combout\);

-- Location: LABCELL_X65_Y30_N54
\counter_bitPeriod[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_bitPeriod[4]~0_combout\ = ( \Mux8~2_combout\ & ( counter_bitPeriod(6) & ( (!counter_bitPeriod(1) & (counter_bitPeriod(0) & (!\counter_bitPeriod[7]~DUPLICATE_q\ $ (!counter_bitPeriod(2))))) ) ) ) # ( \Mux8~2_combout\ & ( !counter_bitPeriod(6) & ( 
-- (counter_bitPeriod(1) & ((!counter_bitPeriod(0) & (!\counter_bitPeriod[7]~DUPLICATE_q\ & counter_bitPeriod(2))) # (counter_bitPeriod(0) & (\counter_bitPeriod[7]~DUPLICATE_q\ & !counter_bitPeriod(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010100000000000000000000000000001000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter_bitPeriod(1),
	datab => ALT_INV_counter_bitPeriod(0),
	datac => \ALT_INV_counter_bitPeriod[7]~DUPLICATE_q\,
	datad => ALT_INV_counter_bitPeriod(2),
	datae => \ALT_INV_Mux8~2_combout\,
	dataf => ALT_INV_counter_bitPeriod(6),
	combout => \counter_bitPeriod[4]~0_combout\);

-- Location: FF_X64_Y29_N11
\pseudoRandomNumberGenerator[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(15),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(0));

-- Location: FF_X64_Y29_N8
\pseudoRandomNumberGenerator[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(0),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(1));

-- Location: FF_X64_Y29_N41
\pseudoRandomNumberGenerator[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(1),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(2));

-- Location: LABCELL_X64_Y29_N36
\pseudoRandomNumberGenerator[3]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \pseudoRandomNumberGenerator[3]~5_combout\ = !pseudoRandomNumberGenerator(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_pseudoRandomNumberGenerator(2),
	combout => \pseudoRandomNumberGenerator[3]~5_combout\);

-- Location: FF_X64_Y29_N38
\pseudoRandomNumberGenerator[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \pseudoRandomNumberGenerator[3]~5_combout\,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(3));

-- Location: FF_X64_Y29_N47
\pseudoRandomNumberGenerator[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(3),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(4));

-- Location: LABCELL_X64_Y29_N42
\pseudoRandomNumberGenerator[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \pseudoRandomNumberGenerator[5]~4_combout\ = !pseudoRandomNumberGenerator(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_pseudoRandomNumberGenerator(4),
	combout => \pseudoRandomNumberGenerator[5]~4_combout\);

-- Location: FF_X64_Y29_N44
\pseudoRandomNumberGenerator[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \pseudoRandomNumberGenerator[5]~4_combout\,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(5));

-- Location: LABCELL_X64_Y29_N51
\pseudoRandomNumberGenerator[6]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \pseudoRandomNumberGenerator[6]~3_combout\ = !pseudoRandomNumberGenerator(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_pseudoRandomNumberGenerator(5),
	combout => \pseudoRandomNumberGenerator[6]~3_combout\);

-- Location: FF_X64_Y29_N53
\pseudoRandomNumberGenerator[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \pseudoRandomNumberGenerator[6]~3_combout\,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(6));

-- Location: LABCELL_X64_Y29_N48
\pseudoRandomNumberGenerator[7]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \pseudoRandomNumberGenerator[7]~2_combout\ = !pseudoRandomNumberGenerator(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_pseudoRandomNumberGenerator(6),
	combout => \pseudoRandomNumberGenerator[7]~2_combout\);

-- Location: FF_X64_Y29_N49
\pseudoRandomNumberGenerator[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \pseudoRandomNumberGenerator[7]~2_combout\,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(7));

-- Location: LABCELL_X64_Y29_N21
\pseudoRandomNumberGenerator[8]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pseudoRandomNumberGenerator[8]~1_combout\ = !pseudoRandomNumberGenerator(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_pseudoRandomNumberGenerator(7),
	combout => \pseudoRandomNumberGenerator[8]~1_combout\);

-- Location: FF_X64_Y29_N23
\pseudoRandomNumberGenerator[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \pseudoRandomNumberGenerator[8]~1_combout\,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(8));

-- Location: FF_X64_Y29_N20
\pseudoRandomNumberGenerator[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(8),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(9));

-- Location: FF_X64_Y29_N59
\pseudoRandomNumberGenerator[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(9),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(10));

-- Location: FF_X64_Y29_N35
\pseudoRandomNumberGenerator[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(10),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(11));

-- Location: FF_X64_Y29_N1
\pseudoRandomNumberGenerator[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(11),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(12));

-- Location: FF_X64_Y29_N55
\pseudoRandomNumberGenerator[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(12),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(13));

-- Location: LABCELL_X64_Y29_N24
\pseudoRandomNumberGenerator[14]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pseudoRandomNumberGenerator[14]~0_combout\ = !pseudoRandomNumberGenerator(13)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_pseudoRandomNumberGenerator(13),
	combout => \pseudoRandomNumberGenerator[14]~0_combout\);

-- Location: FF_X64_Y29_N25
\pseudoRandomNumberGenerator[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \pseudoRandomNumberGenerator[14]~0_combout\,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(14));

-- Location: FF_X64_Y29_N31
\pseudoRandomNumberGenerator[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => pseudoRandomNumberGenerator(14),
	sload => VCC,
	ena => \counter_bitPeriod[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pseudoRandomNumberGenerator(15));

-- Location: LABCELL_X64_Y29_N12
\bit_a_transmettre~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bit_a_transmettre~0_combout\ = !pseudoRandomNumberGenerator(15)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_pseudoRandomNumberGenerator(15),
	combout => \bit_a_transmettre~0_combout\);

-- Location: FF_X64_Y29_N14
bit_a_transmettre : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \bit_a_transmettre~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_a_transmettre~q\);

-- Location: FF_X53_Y41_N2
\dspbuilder_inst|delay|DelayWithInit|result[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~1_sumout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(0));

-- Location: FF_X51_Y41_N20
\dspbuilder_inst|delay|DelayWithInit|result[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~0_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(1));

-- Location: LABCELL_X51_Y41_N51
\dspbuilder_inst|delay|DelayWithInit|result[1]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result[1]~_wirecell_combout\ = !\dspbuilder_inst|delay|DelayWithInit|result\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(1),
	combout => \dspbuilder_inst|delay|DelayWithInit|result[1]~_wirecell_combout\);

-- Location: FF_X51_Y41_N52
\dspbuilder_inst|delay1|DelayWithInit|result[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result[1]~_wirecell_combout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(1));

-- Location: LABCELL_X54_Y41_N30
\dspbuilder_inst|delay1|DelayWithInit|result~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~0_combout\ = ( !\dspbuilder_inst|delay|DelayWithInit|result\(2) & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(2),
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~0_combout\);

-- Location: FF_X54_Y41_N32
\dspbuilder_inst|delay1|DelayWithInit|result[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~0_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(2));

-- Location: LABCELL_X54_Y41_N24
\dspbuilder_inst|delay|DelayWithInit|result[3]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result[3]~_wirecell_combout\ = !\dspbuilder_inst|delay|DelayWithInit|result\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(3),
	combout => \dspbuilder_inst|delay|DelayWithInit|result[3]~_wirecell_combout\);

-- Location: FF_X54_Y41_N25
\dspbuilder_inst|delay1|DelayWithInit|result[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result[3]~_wirecell_combout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(3));

-- Location: LABCELL_X54_Y41_N0
\dspbuilder_inst|delay1|DelayWithInit|result~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~1_combout\ = (!\bit_a_transmettre~q\ & !\dspbuilder_inst|delay|DelayWithInit|result\(4))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	datac => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(4),
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~1_combout\);

-- Location: FF_X54_Y41_N2
\dspbuilder_inst|delay1|DelayWithInit|result[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~1_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(4));

-- Location: FF_X54_Y41_N8
\dspbuilder_inst|delay|DelayWithInit|result[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~2_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[5]~DUPLICATE_q\);

-- Location: LABCELL_X54_Y41_N12
\dspbuilder_inst|delay|DelayWithInit|result[5]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result[5]~_wirecell_combout\ = !\dspbuilder_inst|delay|DelayWithInit|result[5]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result[5]~DUPLICATE_q\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result[5]~_wirecell_combout\);

-- Location: FF_X54_Y41_N14
\dspbuilder_inst|delay1|DelayWithInit|result[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result[5]~_wirecell_combout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(5));

-- Location: FF_X53_Y41_N49
\dspbuilder_inst|delay|DelayWithInit|result[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~3_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(6));

-- Location: LABCELL_X54_Y41_N3
\dspbuilder_inst|delay1|DelayWithInit|result~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~2_combout\ = (!\bit_a_transmettre~q\ & \dspbuilder_inst|delay|DelayWithInit|result\(6))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	datac => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(6),
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~2_combout\);

-- Location: FF_X54_Y41_N4
\dspbuilder_inst|delay1|DelayWithInit|result[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~2_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(6));

-- Location: FF_X53_Y41_N58
\dspbuilder_inst|delay|DelayWithInit|result[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~4_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(8));

-- Location: LABCELL_X54_Y41_N39
\dspbuilder_inst|delay|DelayWithInit|result[8]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result[8]~_wirecell_combout\ = !\dspbuilder_inst|delay|DelayWithInit|result\(8)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(8),
	combout => \dspbuilder_inst|delay|DelayWithInit|result[8]~_wirecell_combout\);

-- Location: FF_X54_Y41_N40
\dspbuilder_inst|delay1|DelayWithInit|result[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result[8]~_wirecell_combout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(8));

-- Location: FF_X53_Y41_N53
\dspbuilder_inst|delay|DelayWithInit|result[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~5_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(9));

-- Location: LABCELL_X54_Y41_N42
\dspbuilder_inst|delay1|DelayWithInit|result~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~4_combout\ = ( \dspbuilder_inst|delay|DelayWithInit|result\(9) & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(9),
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~4_combout\);

-- Location: FF_X54_Y41_N44
\dspbuilder_inst|delay1|DelayWithInit|result[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~4_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(9));

-- Location: FF_X53_Y41_N46
\dspbuilder_inst|delay|DelayWithInit|result[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~6_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(10));

-- Location: LABCELL_X54_Y41_N36
\dspbuilder_inst|delay1|DelayWithInit|result~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~5_combout\ = (!\bit_a_transmettre~q\ & \dspbuilder_inst|delay|DelayWithInit|result\(10))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	datac => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(10),
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~5_combout\);

-- Location: FF_X54_Y41_N37
\dspbuilder_inst|delay1|DelayWithInit|result[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~5_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(10));

-- Location: FF_X53_Y41_N56
\dspbuilder_inst|delay|DelayWithInit|result[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~7_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(11));

-- Location: LABCELL_X54_Y41_N51
\dspbuilder_inst|delay1|DelayWithInit|result~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~6_combout\ = ( \dspbuilder_inst|delay|DelayWithInit|result\(11) & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(11),
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~6_combout\);

-- Location: FF_X54_Y41_N53
\dspbuilder_inst|delay1|DelayWithInit|result[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~6_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(11));

-- Location: FF_X54_Y41_N56
\dspbuilder_inst|delay|DelayWithInit|result[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~8_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(12));

-- Location: LABCELL_X54_Y41_N45
\dspbuilder_inst|delay1|DelayWithInit|result~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~7_combout\ = (\dspbuilder_inst|delay|DelayWithInit|result\(12) & !\bit_a_transmettre~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(12),
	datab => \ALT_INV_bit_a_transmettre~q\,
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~7_combout\);

-- Location: FF_X54_Y41_N47
\dspbuilder_inst|delay1|DelayWithInit|result[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~7_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(12));

-- Location: FF_X53_Y41_N43
\dspbuilder_inst|delay|DelayWithInit|result[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~9_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(13));

-- Location: LABCELL_X51_Y41_N54
\dspbuilder_inst|delay1|DelayWithInit|result~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~8_combout\ = ( !\bit_a_transmettre~q\ & ( \dspbuilder_inst|delay|DelayWithInit|result\(13) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000000000000000110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(13),
	datae => \ALT_INV_bit_a_transmettre~q\,
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~8_combout\);

-- Location: FF_X51_Y41_N56
\dspbuilder_inst|delay1|DelayWithInit|result[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~8_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(13));

-- Location: DSP_X52_Y41_N0
\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 18,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 18,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "true",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	ax => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_AX_bus\,
	ay => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_AY_bus\,
	resulta => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|Mult0~8_RESULTA_bus\);

-- Location: LABCELL_X54_Y41_N18
\dspbuilder_inst|delay1|DelayWithInit|result~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay1|DelayWithInit|result~3_combout\ = ( !\bit_a_transmettre~q\ & ( !\dspbuilder_inst|delay|DelayWithInit|result\(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay|DelayWithInit|ALT_INV_result\(7),
	dataf => \ALT_INV_bit_a_transmettre~q\,
	combout => \dspbuilder_inst|delay1|DelayWithInit|result~3_combout\);

-- Location: FF_X54_Y41_N19
\dspbuilder_inst|delay1|DelayWithInit|result[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay1|DelayWithInit|result~3_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(7));

-- Location: FF_X53_Y41_N11
\dspbuilder_inst|delay1|DelayWithInit|result[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \dspbuilder_inst|delay|DelayWithInit|result\(0),
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay1|DelayWithInit|result\(0));

-- Location: LABCELL_X53_Y41_N0
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~1_sumout\ = SUM(( !\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(16) $ (!\dspbuilder_inst|delay1|DelayWithInit|result\(0)) ) + ( !VCC ) + ( 
-- !VCC ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~2\ = CARRY(( !\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(16) $ (!\dspbuilder_inst|delay1|DelayWithInit|result\(0)) ) + ( !VCC ) + ( !VCC 
-- ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~3\ = SHARE((!\dspbuilder_inst|delay1|DelayWithInit|result\(0)) # (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(16)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100111111001100000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(16),
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(0),
	cin => GND,
	sharein => GND,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~1_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~2\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~3\);

-- Location: LABCELL_X53_Y41_N3
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(1) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(17)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~3\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~2\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~6\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(1) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(17)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~3\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~2\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~7\ = SHARE((!\dspbuilder_inst|delay1|DelayWithInit|result\(1) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(17)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(1),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(17),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~2\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~3\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~6\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~7\);

-- Location: LABCELL_X53_Y41_N6
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~9_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(2) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(18)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~7\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~6\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~10\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(2) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(18)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~7\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~6\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~11\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(2) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(18)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(2),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(18),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~6\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~7\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~9_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~10\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~11\);

-- Location: LABCELL_X53_Y41_N9
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(3) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(19)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~11\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~10\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~14\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(3) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(19)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~11\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~10\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~15\ = SHARE((!\dspbuilder_inst|delay1|DelayWithInit|result\(3) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(19)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000001010010110100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(3),
	datac => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(19),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~10\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~11\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~14\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~15\);

-- Location: LABCELL_X53_Y41_N12
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~17_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(4) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(20)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~15\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~14\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~18\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(4) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(20)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~15\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~14\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~19\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(4) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(20)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(4),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(20),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~14\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~15\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~17_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~18\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~19\);

-- Location: LABCELL_X53_Y41_N15
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(5) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(21)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~19\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~18\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~22\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(5) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(21)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~19\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~18\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~23\ = SHARE((!\dspbuilder_inst|delay1|DelayWithInit|result\(5) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(21)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(5),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(21),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~18\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~19\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~22\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~23\);

-- Location: LABCELL_X53_Y41_N18
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(6) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(22)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~23\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~22\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~26\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(6) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(22)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~23\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~22\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~27\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(6) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(22)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000011001100000000000000000011001111001100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(6),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(22),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~22\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~23\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~26\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~27\);

-- Location: LABCELL_X53_Y41_N21
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~29_sumout\ = SUM(( !\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(23) $ (!\dspbuilder_inst|delay1|DelayWithInit|result\(7)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~27\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~26\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~30\ = CARRY(( !\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(23) $ (!\dspbuilder_inst|delay1|DelayWithInit|result\(7)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~27\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~26\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~31\ = SHARE((\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(23) & \dspbuilder_inst|delay1|DelayWithInit|result\(7)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(23),
	datad => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(7),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~26\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~27\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~29_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~30\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~31\);

-- Location: LABCELL_X53_Y41_N24
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(8) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(24)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~31\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~30\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~34\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(8) $ (\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(24)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~31\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~30\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~35\ = SHARE((!\dspbuilder_inst|delay1|DelayWithInit|result\(8) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(24)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(8),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(24),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~30\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~31\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~34\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~35\);

-- Location: LABCELL_X53_Y41_N27
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(9) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(25)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~35\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~34\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~38\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(9) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(25)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~35\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~34\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~39\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(9) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(25)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(9),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(25),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~34\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~35\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~38\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~39\);

-- Location: LABCELL_X53_Y41_N30
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(10) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(26)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~39\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~38\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~42\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(10) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(26)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~39\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~38\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~43\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(10) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(26)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110000001100000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(10),
	datac => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(26),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~38\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~39\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~42\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~43\);

-- Location: LABCELL_X53_Y41_N33
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(11) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(27)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~43\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~42\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~46\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(11) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(27)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~43\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~42\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~47\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(11) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(27)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000101010100000000000000000101010110101010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(11),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(27),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~42\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~43\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~46\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~47\);

-- Location: LABCELL_X53_Y41_N36
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(12) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(28)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~47\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~46\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~50\ = CARRY(( !\dspbuilder_inst|delay1|DelayWithInit|result\(12) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(28)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~47\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~46\ ))
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~51\ = SHARE((\dspbuilder_inst|delay1|DelayWithInit|result\(12) & \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(28)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(12),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(28),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~46\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~47\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49_sumout\,
	cout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~50\,
	shareout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~51\);

-- Location: LABCELL_X53_Y41_N39
\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~53_sumout\ = SUM(( !\dspbuilder_inst|delay1|DelayWithInit|result\(13) $ (!\dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|result\(29)) ) + ( 
-- \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~51\ ) + ( \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \dspbuilder_inst|delay1|DelayWithInit|ALT_INV_result\(13),
	datad => \dspbuilder_inst|multiplier|Multiplieri|gcomb:U0|auto_generated|ALT_INV_result\(29),
	cin => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~50\,
	sharein => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~51\,
	sumout => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~53_sumout\);

-- Location: LABCELL_X53_Y41_N42
\dspbuilder_inst|delay|DelayWithInit|result~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~9_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~53_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~53_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~9_combout\);

-- Location: FF_X53_Y41_N44
\dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~9_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[13]~DUPLICATE_q\);

-- Location: LABCELL_X54_Y41_N54
\dspbuilder_inst|delay|DelayWithInit|result~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~8_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~49_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~49_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~8_combout\);

-- Location: FF_X54_Y41_N55
\dspbuilder_inst|delay|DelayWithInit|result[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~8_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[12]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y41_N54
\dspbuilder_inst|delay|DelayWithInit|result~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~7_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~45_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~45_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~7_combout\);

-- Location: FF_X53_Y41_N55
\dspbuilder_inst|delay|DelayWithInit|result[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~7_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[11]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y41_N45
\dspbuilder_inst|delay|DelayWithInit|result~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~6_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~41_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~41_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~6_combout\);

-- Location: FF_X53_Y41_N47
\dspbuilder_inst|delay|DelayWithInit|result[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~6_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[10]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y41_N51
\dspbuilder_inst|delay|DelayWithInit|result~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~5_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~37_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~37_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~5_combout\);

-- Location: FF_X53_Y41_N52
\dspbuilder_inst|delay|DelayWithInit|result[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~5_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[9]~DUPLICATE_q\);

-- Location: LABCELL_X53_Y41_N57
\dspbuilder_inst|delay|DelayWithInit|result~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~4_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~33_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~33_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~4_combout\);

-- Location: FF_X53_Y41_N59
\dspbuilder_inst|delay|DelayWithInit|result[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~4_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[8]~DUPLICATE_q\);

-- Location: FF_X53_Y41_N23
\dspbuilder_inst|delay|DelayWithInit|result[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~29_sumout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(7));

-- Location: LABCELL_X53_Y41_N48
\dspbuilder_inst|delay|DelayWithInit|result~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~3_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~25_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~25_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~3_combout\);

-- Location: FF_X53_Y41_N50
\dspbuilder_inst|delay|DelayWithInit|result[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~3_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[6]~DUPLICATE_q\);

-- Location: LABCELL_X54_Y41_N6
\dspbuilder_inst|delay|DelayWithInit|result~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~2_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~21_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~21_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~2_combout\);

-- Location: FF_X54_Y41_N7
\dspbuilder_inst|delay|DelayWithInit|result[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~2_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(5));

-- Location: FF_X53_Y41_N14
\dspbuilder_inst|delay|DelayWithInit|result[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~17_sumout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(4));

-- Location: LABCELL_X54_Y41_N33
\dspbuilder_inst|delay|DelayWithInit|result~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~1_combout\ = ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~13_sumout\ & ( !\bit_a_transmettre~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~13_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~1_combout\);

-- Location: FF_X54_Y41_N35
\dspbuilder_inst|delay|DelayWithInit|result[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~1_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(3));

-- Location: FF_X53_Y41_N8
\dspbuilder_inst|delay|DelayWithInit|result[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~9_sumout\,
	clrn => counter_reset(10),
	sclr => \bit_a_transmettre~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result\(2));

-- Location: LABCELL_X51_Y41_N18
\dspbuilder_inst|delay|DelayWithInit|result~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dspbuilder_inst|delay|DelayWithInit|result~0_combout\ = ( !\bit_a_transmettre~q\ & ( !\dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|op_1~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_bit_a_transmettre~q\,
	dataf => \dspbuilder_inst|parallel_adder_subtractor|adder_1_1|nopip:gensa:U0|auto_generated|ALT_INV_op_1~5_sumout\,
	combout => \dspbuilder_inst|delay|DelayWithInit|result~0_combout\);

-- Location: FF_X51_Y41_N19
\dspbuilder_inst|delay|DelayWithInit|result[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \dspbuilder_inst|delay|DelayWithInit|result~0_combout\,
	clrn => counter_reset(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dspbuilder_inst|delay|DelayWithInit|result[1]~DUPLICATE_q\);

-- Location: LABCELL_X65_Y30_N18
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( counter_bitPeriod(6) & ( (counter_bitPeriod(3) & (counter_bitPeriod(4) & (!counter_bitPeriod(1) & counter_bitPeriod(5)))) ) ) # ( !counter_bitPeriod(6) & ( (counter_bitPeriod(3) & (counter_bitPeriod(4) & (counter_bitPeriod(1) & 
-- counter_bitPeriod(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_counter_bitPeriod(3),
	datab => ALT_INV_counter_bitPeriod(4),
	datac => ALT_INV_counter_bitPeriod(1),
	datad => ALT_INV_counter_bitPeriod(5),
	dataf => ALT_INV_counter_bitPeriod(6),
	combout => \Mux8~0_combout\);

-- Location: LABCELL_X65_Y30_N12
\Mux8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = ( \bitclk_i~q\ & ( counter_bitPeriod(7) & ( (\Mux8~0_combout\ & (!counter_bitPeriod(2) & counter_bitPeriod(0))) ) ) ) # ( !\bitclk_i~q\ & ( counter_bitPeriod(7) & ( (\Mux8~0_combout\ & (!counter_bitPeriod(2) & (counter_bitPeriod(6) & 
-- counter_bitPeriod(0)))) ) ) ) # ( \bitclk_i~q\ & ( !counter_bitPeriod(7) & ( (\Mux8~0_combout\ & (counter_bitPeriod(2) & (!counter_bitPeriod(6) $ (counter_bitPeriod(0))))) ) ) ) # ( !\bitclk_i~q\ & ( !counter_bitPeriod(7) & ( (\Mux8~0_combout\ & 
-- (counter_bitPeriod(2) & (counter_bitPeriod(6) & counter_bitPeriod(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000100000000000100000000000001000000000001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux8~0_combout\,
	datab => ALT_INV_counter_bitPeriod(2),
	datac => ALT_INV_counter_bitPeriod(6),
	datad => ALT_INV_counter_bitPeriod(0),
	datae => \ALT_INV_bitclk_i~q\,
	dataf => ALT_INV_counter_bitPeriod(7),
	combout => \Mux8~1_combout\);

-- Location: FF_X65_Y30_N13
bitclk_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Mux8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bitclk_i~q\);

-- Location: IOIBUF_X14_Y0_N35
\SWITCH[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(0),
	o => \SWITCH[0]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\SWITCH[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(1),
	o => \SWITCH[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N35
\SWITCH[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(2),
	o => \SWITCH[2]~input_o\);

-- Location: IOIBUF_X14_Y0_N52
\SWITCH[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(3),
	o => \SWITCH[3]~input_o\);

-- Location: IOIBUF_X10_Y0_N41
\SWITCH[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(4),
	o => \SWITCH[4]~input_o\);

-- Location: IOIBUF_X12_Y0_N35
\SWITCH[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(5),
	o => \SWITCH[5]~input_o\);

-- Location: IOIBUF_X17_Y0_N75
\SWITCH[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(6),
	o => \SWITCH[6]~input_o\);

-- Location: IOIBUF_X12_Y0_N52
\SWITCH[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(7),
	o => \SWITCH[7]~input_o\);

-- Location: IOIBUF_X10_Y0_N58
\SWITCH[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(8),
	o => \SWITCH[8]~input_o\);

-- Location: IOIBUF_X50_Y0_N35
\SWITCH[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SWITCH(9),
	o => \SWITCH[9]~input_o\);

-- Location: IOIBUF_X21_Y0_N1
\BUTTON[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(0),
	o => \BUTTON[0]~input_o\);

-- Location: IOIBUF_X21_Y0_N18
\BUTTON[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(1),
	o => \BUTTON[1]~input_o\);

-- Location: IOIBUF_X46_Y0_N1
\BUTTON[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(2),
	o => \BUTTON[2]~input_o\);

-- Location: IOIBUF_X46_Y0_N18
\BUTTON[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BUTTON(3),
	o => \BUTTON[3]~input_o\);

-- Location: LABCELL_X63_Y53_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
		number_of_fplls => 1);
-- pragma translate_on
END structure;


