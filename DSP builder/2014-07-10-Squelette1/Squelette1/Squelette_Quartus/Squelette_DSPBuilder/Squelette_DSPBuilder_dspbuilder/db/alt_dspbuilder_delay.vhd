-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_delay is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 0;
		BITPATTERN : string := "00000001";
		WIDTH : positive := 8
	);
	port (
		input : in std_logic_vector(width-1 downto 0) := (others=>'0');
		clock : in std_logic := '0';
		sclr : in std_logic := '0';
		aclr : in std_logic := '0';
		output : out std_logic_vector(width-1 downto 0);
		ena : in std_logic := '0'
	);
end entity alt_dspbuilder_delay;

architecture rtl of alt_dspbuilder_delay is

component alt_dspbuilder_delay_GN6TGYZDFK is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 1;
		BITPATTERN : string := "11111101101010";
		WIDTH : positive := 14
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(14-1 downto 0) := (others=>'0');
		output : out std_logic_vector(14-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GN6TGYZDFK;

component alt_dspbuilder_delay_GNQOGXYDHZ is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 1;
		BITPATTERN : string := "11111011010100";
		WIDTH : positive := 14
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(14-1 downto 0) := (others=>'0');
		output : out std_logic_vector(14-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNQOGXYDHZ;

begin

alt_dspbuilder_delay_GN6TGYZDFK_0: if ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 1) and (BITPATTERN = "11111101101010") and (WIDTH = 14)) generate
	inst_alt_dspbuilder_delay_GN6TGYZDFK_0: alt_dspbuilder_delay_GN6TGYZDFK
		generic map(CLOCKPHASE => "1", DELAY => 1, USE_INIT => 1, BITPATTERN => "11111101101010", WIDTH => 14)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

alt_dspbuilder_delay_GNQOGXYDHZ_1: if ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 1) and (BITPATTERN = "11111011010100") and (WIDTH = 14)) generate
	inst_alt_dspbuilder_delay_GNQOGXYDHZ_1: alt_dspbuilder_delay_GNQOGXYDHZ
		generic map(CLOCKPHASE => "1", DELAY => 1, USE_INIT => 1, BITPATTERN => "11111011010100", WIDTH => 14)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

assert not (((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 1) and (BITPATTERN = "11111101101010") and (WIDTH = 14)) or ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 1) and (BITPATTERN = "11111011010100") and (WIDTH = 14)))
	report "Please run generate again" severity error;

end architecture rtl;

