-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_testbench_clock is
	generic (
		PHASE_DELAY : string := "0 ns";
		SIMULATION_START_CYCLE : natural := 4;
		RESET_LATENCY : natural := 0;
		INITIAL_CLOCK : natural := 1;
		PERIOD : string := "20 ns";
		RESET_REGISTER_CASCADE_DEPTH : natural := 0
	);
	port (
		clock_out : out std_logic;
		aclr_out : out std_logic;
		tb_aclr : out std_logic;
		reg_aclr_out : out std_logic
	);
end entity alt_dspbuilder_testbench_clock;

architecture rtl of alt_dspbuilder_testbench_clock is

component alt_dspbuilder_testbench_clock_GNCGUFKHRR is
	generic (
		PHASE_DELAY : string := "0 fs";
		SIMULATION_START_CYCLE : natural := 4;
		RESET_LATENCY : natural := 0;
		INITIAL_CLOCK : natural := 1;
		PERIOD : string := "20 ns";
		RESET_REGISTER_CASCADE_DEPTH : natural := 0
	);
	port (
		aclr_out : out std_logic;
		clock_out : out std_logic;
		reg_aclr_out : out std_logic;
		tb_aclr : out std_logic
	);
end component alt_dspbuilder_testbench_clock_GNCGUFKHRR;

component alt_dspbuilder_testbench_clock_GNSAS6FNZP is
	generic (
		PHASE_DELAY : string := "0 fs";
		SIMULATION_START_CYCLE : natural := 4;
		RESET_LATENCY : natural := 0;
		INITIAL_CLOCK : natural := 1;
		PERIOD : string := "16 ns";
		RESET_REGISTER_CASCADE_DEPTH : natural := 0
	);
	port (
		aclr_out : out std_logic;
		clock_out : out std_logic;
		reg_aclr_out : out std_logic;
		tb_aclr : out std_logic
	);
end component alt_dspbuilder_testbench_clock_GNSAS6FNZP;

component alt_dspbuilder_testbench_clock_GNB4F5J4FW is
	generic (
		PHASE_DELAY : string := "0 fs";
		SIMULATION_START_CYCLE : natural := 4;
		RESET_LATENCY : natural := 0;
		INITIAL_CLOCK : natural := 1;
		PERIOD : string := "500 ns";
		RESET_REGISTER_CASCADE_DEPTH : natural := 0
	);
	port (
		aclr_out : out std_logic;
		clock_out : out std_logic;
		reg_aclr_out : out std_logic;
		tb_aclr : out std_logic
	);
end component alt_dspbuilder_testbench_clock_GNB4F5J4FW;

component alt_dspbuilder_testbench_clock_GN3JWMVXTD is
	generic (
		PHASE_DELAY : string := "0 fs";
		SIMULATION_START_CYCLE : natural := 4;
		RESET_LATENCY : natural := 0;
		INITIAL_CLOCK : natural := 1;
		PERIOD : string := "8 ns";
		RESET_REGISTER_CASCADE_DEPTH : natural := 0
	);
	port (
		aclr_out : out std_logic;
		clock_out : out std_logic;
		reg_aclr_out : out std_logic;
		tb_aclr : out std_logic
	);
end component alt_dspbuilder_testbench_clock_GN3JWMVXTD;

begin

alt_dspbuilder_testbench_clock_GNCGUFKHRR_0: if ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "20 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) generate
	inst_alt_dspbuilder_testbench_clock_GNCGUFKHRR_0: alt_dspbuilder_testbench_clock_GNCGUFKHRR
		generic map(PHASE_DELAY => "0 fs", SIMULATION_START_CYCLE => 4, RESET_LATENCY => 0, INITIAL_CLOCK => 1, PERIOD => "20 ns", RESET_REGISTER_CASCADE_DEPTH => 0)
		port map(aclr_out => aclr_out, clock_out => clock_out, reg_aclr_out => reg_aclr_out, tb_aclr => tb_aclr);
end generate;

alt_dspbuilder_testbench_clock_GNSAS6FNZP_1: if ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "16 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) generate
	inst_alt_dspbuilder_testbench_clock_GNSAS6FNZP_1: alt_dspbuilder_testbench_clock_GNSAS6FNZP
		generic map(PHASE_DELAY => "0 fs", SIMULATION_START_CYCLE => 4, RESET_LATENCY => 0, INITIAL_CLOCK => 1, PERIOD => "16 ns", RESET_REGISTER_CASCADE_DEPTH => 0)
		port map(aclr_out => aclr_out, clock_out => clock_out, reg_aclr_out => reg_aclr_out, tb_aclr => tb_aclr);
end generate;

alt_dspbuilder_testbench_clock_GNB4F5J4FW_2: if ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "500 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) generate
	inst_alt_dspbuilder_testbench_clock_GNB4F5J4FW_2: alt_dspbuilder_testbench_clock_GNB4F5J4FW
		generic map(PHASE_DELAY => "0 fs", SIMULATION_START_CYCLE => 4, RESET_LATENCY => 0, INITIAL_CLOCK => 1, PERIOD => "500 ns", RESET_REGISTER_CASCADE_DEPTH => 0)
		port map(aclr_out => aclr_out, clock_out => clock_out, reg_aclr_out => reg_aclr_out, tb_aclr => tb_aclr);
end generate;

alt_dspbuilder_testbench_clock_GN3JWMVXTD_3: if ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "8 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) generate
	inst_alt_dspbuilder_testbench_clock_GN3JWMVXTD_3: alt_dspbuilder_testbench_clock_GN3JWMVXTD
		generic map(PHASE_DELAY => "0 fs", SIMULATION_START_CYCLE => 4, RESET_LATENCY => 0, INITIAL_CLOCK => 1, PERIOD => "8 ns", RESET_REGISTER_CASCADE_DEPTH => 0)
		port map(aclr_out => aclr_out, clock_out => clock_out, reg_aclr_out => reg_aclr_out, tb_aclr => tb_aclr);
end generate;

assert not (((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "20 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) or ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "16 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) or ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "500 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)) or ((PHASE_DELAY = "0 fs") and (SIMULATION_START_CYCLE = 4) and (RESET_LATENCY = 0) and (INITIAL_CLOCK = 1) and (PERIOD = "8 ns") and (RESET_REGISTER_CASCADE_DEPTH = 0)))
	report "Please run generate again" severity error;

end architecture rtl;

