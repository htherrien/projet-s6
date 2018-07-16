library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_constant_GNDLEE2Y23 is
	generic		( 			HDLTYPE : string := "STD_LOGIC";
			BitPattern : string := "0";
			width : natural := 1);

	port(
		output : out std_logic);		
end entity;

architecture rtl of alt_dspbuilder_constant_GNDLEE2Y23 is 
Begin
-- Constant
output		<=	'0';				
end architecture;