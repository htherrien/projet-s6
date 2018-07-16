library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_bypass_GNGEVLMN77 is
	generic		( 			HDLTYPE : string := "STD_LOGIC_VECTOR";
			width : natural := 14);

	port(
		input : in std_logic_vector(13 downto 0);
		output : out std_logic_vector(13 downto 0));		
end entity;



architecture rtl of alt_dspbuilder_bypass_GNGEVLMN77 is 
Begin

-- Straight Bypass block
output		<=	input;
				
end architecture;