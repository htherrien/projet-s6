library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
entity Squelette_DSPBuilder_example is  
	port(
		aclr_125 : in STD_LOGIC;
		modulateur_bitclock_i : in STD_LOGIC;
		Clock_50MHz : in STD_LOGIC;
		Output_test : out STD_LOGIC;
		aclr_62p5 : in STD_LOGIC;
		modulateur_bitclock_q : in STD_LOGIC;
		Clock_62p5MHz : in STD_LOGIC;
		Clock_2MHz : in STD_LOGIC;
		modulateur_enable : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Output_DAC0 : out STD_LOGIC_VECTOR(13 downto 0);
		aclr_2 : in STD_LOGIC;
		modulateur_bit_a_transmettre : in STD_LOGIC;
		Clock_125MHz : in STD_LOGIC); 
end entity;
architecture rtl of Squelette_DSPBuilder_example is
component Squelette_DSPBuilder
	  
	port(
		aclr_125 : in STD_LOGIC;
		modulateur_bitclock_i : in STD_LOGIC;
		Clock_50MHz : in STD_LOGIC;
		Output_test : out STD_LOGIC;
		aclr_62p5 : in STD_LOGIC;
		modulateur_bitclock_q : in STD_LOGIC;
		Clock_62p5MHz : in STD_LOGIC;
		Clock_2MHz : in STD_LOGIC;
		modulateur_enable : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Output_DAC0 : out STD_LOGIC_VECTOR(13 downto 0);
		aclr_2 : in STD_LOGIC;
		modulateur_bit_a_transmettre : in STD_LOGIC;
		Clock_125MHz : in STD_LOGIC); 
end component;
begin
	Squelette_DSPBuilder_instance : 
		component Squelette_DSPBuilder
			port map(
				aclr_125 => aclr_125,
				modulateur_bitclock_i => modulateur_bitclock_i,
				Clock_50MHz => Clock_50MHz,
				Output_test => Output_test,
				aclr_62p5 => aclr_62p5,
				modulateur_bitclock_q => modulateur_bitclock_q,
				Clock_62p5MHz => Clock_62p5MHz,
				Clock_2MHz => Clock_2MHz,
				modulateur_enable => modulateur_enable,
				aclr => aclr,
				Output_DAC0 => Output_DAC0,
				aclr_2 => aclr_2,
				modulateur_bit_a_transmettre => modulateur_bit_a_transmettre,
				Clock_125MHz => Clock_125MHz);
end architecture rtl;
