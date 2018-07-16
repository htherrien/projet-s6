library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_cast_GN6KYL5EP5 is
	generic		( 			round : natural := 0;
			saturate : natural := 0);

	port(
		input : in std_logic_vector(14 downto 0);
		output : out std_logic_vector(13 downto 0));		
end entity;



architecture rtl of alt_dspbuilder_cast_GN6KYL5EP5 is 
Begin

-- Output - I/O assignment from Simulink Block  "Output"
Outputi : alt_dspbuilder_SBF generic map(
				width_inl=> 15 ,
				width_inr=> 0,
				width_outl=> 14,
				width_outr=> 0,
				lpm_signed=>  BusIsSigned ,
				round=> round,
				satur=> saturate)
		port map (
								xin(14 downto 0)  => input,
																yout => output				
				);
				
end architecture;