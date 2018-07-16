-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Squelette_DSPBuilder is
	port (
		Clock_125MHz : in std_logic;
		Clock_2MHz : in std_logic;
		Clock_50MHz : in std_logic;
		Clock_62p5MHz : in std_logic;
		Output_DAC0 : out std_logic_vector(14-1 downto 0);
		Output_test : out std_logic;
		aclr : in std_logic;
		aclr_125 : in std_logic;
		aclr_2 : in std_logic;
		aclr_62p5 : in std_logic;
		modulateur_bit_a_transmettre : in std_logic;
		modulateur_bitclock_i : in std_logic;
		modulateur_bitclock_q : in std_logic;
		modulateur_enable : in std_logic
	);
end entity Squelette_DSPBuilder;

architecture rtl of Squelette_DSPBuilder is

component Squelette_DSPBuilder_GN is
	port (
		Clock_125MHz : in std_logic;
		Clock_2MHz : in std_logic;
		Clock_50MHz : in std_logic;
		Clock_62p5MHz : in std_logic;
		Output_DAC0 : out std_logic_vector(14-1 downto 0);
		Output_test : out std_logic;
		aclr : in std_logic;
		aclr_125 : in std_logic;
		aclr_2 : in std_logic;
		aclr_62p5 : in std_logic;
		modulateur_bit_a_transmettre : in std_logic;
		modulateur_bitclock_i : in std_logic;
		modulateur_bitclock_q : in std_logic;
		modulateur_enable : in std_logic
	);
end component Squelette_DSPBuilder_GN;

begin

Squelette_DSPBuilder_GN_0: if true generate
	inst_Squelette_DSPBuilder_GN_0: Squelette_DSPBuilder_GN
		port map(Clock_125MHz => Clock_125MHz, Clock_2MHz => Clock_2MHz, Clock_50MHz => Clock_50MHz, Clock_62p5MHz => Clock_62p5MHz, Output_DAC0 => Output_DAC0, Output_test => Output_test, aclr => aclr, aclr_125 => aclr_125, aclr_2 => aclr_2, aclr_62p5 => aclr_62p5, modulateur_bit_a_transmettre => modulateur_bit_a_transmettre, modulateur_bitclock_i => modulateur_bitclock_i, modulateur_bitclock_q => modulateur_bitclock_q, modulateur_enable => modulateur_enable);
end generate;

end architecture rtl;

