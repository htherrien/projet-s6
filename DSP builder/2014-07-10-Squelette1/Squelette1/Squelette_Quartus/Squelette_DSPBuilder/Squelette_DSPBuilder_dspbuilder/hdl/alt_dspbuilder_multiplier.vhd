-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_multiplier is
	generic (
		DEDICATED_MULTIPLIER_CIRCUITRY : string := "AUTO";
		SIGNED : natural := 0;
		OUTPUTMSB : integer := 8;
		AWIDTH : natural := 8;
		BWIDTH : natural := 8;
		OUTPUTLSB : integer := 0;
		PIPELINE : integer := 0
	);
	port (
		user_aclr : in std_logic;
		result : out std_logic_vector(OutputMsb-OutputLsb+1-1 downto 0);
		clock : in std_logic;
		dataa : in std_logic_vector(aWidth-1 downto 0);
		datab : in std_logic_vector(bWidth-1 downto 0);
		aclr : in std_logic;
		ena : in std_logic
	);
end entity alt_dspbuilder_multiplier;

architecture rtl of alt_dspbuilder_multiplier is

component alt_dspbuilder_multiplier_GNVM2FSDDK is
	generic (
		DEDICATED_MULTIPLIER_CIRCUITRY : string := "YES";
		SIGNED : natural := 1;
		OUTPUTMSB : integer := 32;
		AWIDTH : natural := 14;
		BWIDTH : natural := 19;
		OUTPUTLSB : integer := 0;
		PIPELINE : integer := 0
	);
	port (
		aclr : in std_logic;
		clock : in std_logic;
		dataa : in std_logic_vector(14-1 downto 0);
		datab : in std_logic_vector(19-1 downto 0);
		ena : in std_logic;
		result : out std_logic_vector(33-1 downto 0);
		user_aclr : in std_logic
	);
end component alt_dspbuilder_multiplier_GNVM2FSDDK;

begin

alt_dspbuilder_multiplier_GNVM2FSDDK_0: if ((DEDICATED_MULTIPLIER_CIRCUITRY = "YES") and (SIGNED = 1) and (OUTPUTMSB = 32) and (AWIDTH = 14) and (BWIDTH = 19) and (OUTPUTLSB = 0) and (PIPELINE = 0)) generate
	inst_alt_dspbuilder_multiplier_GNVM2FSDDK_0: alt_dspbuilder_multiplier_GNVM2FSDDK
		generic map(DEDICATED_MULTIPLIER_CIRCUITRY => "YES", SIGNED => 1, OUTPUTMSB => 32, AWIDTH => 14, BWIDTH => 19, OUTPUTLSB => 0, PIPELINE => 0)
		port map(aclr => aclr, clock => clock, dataa => dataa, datab => datab, ena => ena, result => result, user_aclr => user_aclr);
end generate;

assert not (((DEDICATED_MULTIPLIER_CIRCUITRY = "YES") and (SIGNED = 1) and (OUTPUTMSB = 32) and (AWIDTH = 14) and (BWIDTH = 19) and (OUTPUTLSB = 0) and (PIPELINE = 0)))
	report "Please run generate again" severity error;

end architecture rtl;

