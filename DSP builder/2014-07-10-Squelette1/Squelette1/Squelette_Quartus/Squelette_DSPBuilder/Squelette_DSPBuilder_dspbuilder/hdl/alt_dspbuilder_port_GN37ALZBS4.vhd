library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_port_GN37ALZBS4 is


	port(
		input : in std_logic;
		output : out std_logic);		
end entity;



architecture rtl of alt_dspbuilder_port_GN37ALZBS4 is 
Begin

-- Straight Bypass block
output		<=	input;
				
end architecture;