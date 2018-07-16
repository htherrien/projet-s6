library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_constant_GN2B647OZU is
	generic		( 			HDLTYPE : string := "STD_LOGIC_VECTOR";
			BitPattern : string := "0011111111111010111";
			width : natural := 19);

	port(
		output : out std_logic_vector(18 downto 0));		
end entity;

architecture rtl of alt_dspbuilder_constant_GN2B647OZU is 
Begin
-- Constant
output		<=	"0011111111111010111";				
end architecture;