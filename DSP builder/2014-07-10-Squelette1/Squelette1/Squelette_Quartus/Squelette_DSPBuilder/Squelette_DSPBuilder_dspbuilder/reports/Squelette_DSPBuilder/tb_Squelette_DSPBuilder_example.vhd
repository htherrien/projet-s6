library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
entity tb_Squelette_DSPBuilder_example is   
end entity;
architecture rtl of tb_Squelette_DSPBuilder_example is
component tb_Squelette_DSPBuilder
	   
end component;
begin
	tb_Squelette_DSPBuilder_instance : 
		component tb_Squelette_DSPBuilder
			port map();
end architecture rtl;
