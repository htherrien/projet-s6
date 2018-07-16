-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_gnd is
	port (
		output : out std_logic
	);
end entity alt_dspbuilder_gnd;

architecture rtl of alt_dspbuilder_gnd is

component alt_dspbuilder_gnd_GN is
	port (
		output : out std_logic
	);
end component alt_dspbuilder_gnd_GN;

begin

alt_dspbuilder_gnd_GN_0: if true generate
	inst_alt_dspbuilder_gnd_GN_0: alt_dspbuilder_gnd_GN
		port map(output => output);
end generate;

end architecture rtl;

