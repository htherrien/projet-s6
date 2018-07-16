library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_flipflop_GNY4TSSV7N is
	generic		( 			Mode : string := "DFFE";
			width : positive := 1);

	port(
		clock : in std_logic;
		aclr : in std_logic;
		input : in std_logic;
		user_aprn : in std_logic;
		user_aclrn : in std_logic;
		ena : in std_logic;
		q : out std_logic);		
end entity;

architecture rtl of alt_dspbuilder_flipflop_GNY4TSSV7N is 
signal in_vect : std_logic_vector( 1 -1 downto 0);
signal out_vect : std_logic_vector( 1 -1 downto 0);
signal aclrn_signal : std_logic;
Begin

-- DSP Builder Block - Simulink Block "FlipFlop"
aclrn_signal <= user_aclrn and not aclr;

	in_vect(0) <= input; 
	q <= out_vect(0);
	

FlipFlopi : alt_dspbuilder_DFFEALTR  Generic map (
				width	=>	1)
		port map (
				clock	=>	clock,
				ena		=>	ena,	
				d		=> 	in_vect,
				prn		=>	user_aprn,
				clrn	=>	aclrn_signal,
				q		=> out_vect);

end architecture;