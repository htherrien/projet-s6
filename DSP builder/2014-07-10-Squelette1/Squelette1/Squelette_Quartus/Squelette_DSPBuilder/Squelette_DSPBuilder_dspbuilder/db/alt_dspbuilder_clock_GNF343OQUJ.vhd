library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_clock_GNF343OQUJ is


	port(
		aclr : in std_logic;
		aclr_n : in std_logic;
		aclr_out : out std_logic;
		clock : in std_logic;
		clock_out : out std_logic);		
end entity;



architecture rtl of alt_dspbuilder_clock_GNF343OQUJ is 
Begin

	-- Straight Bypass Clock 
	clock_out		<=	clock;

	-- reset logic
	aclr_out		<=	not(aclr_n);

end architecture;