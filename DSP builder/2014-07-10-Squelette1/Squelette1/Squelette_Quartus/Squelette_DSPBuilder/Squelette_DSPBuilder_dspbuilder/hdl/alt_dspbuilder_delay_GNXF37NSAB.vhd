library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_delay_GNXF37NSAB is
	generic		( 			ClockPhase : string := "1";
			delay : positive := 1;
			use_init : natural := 1;
			BitPattern : string := "11111110110000";
			width : positive := 14);

	port(
		aclr : in std_logic;
		clock : in std_logic;
		ena : in std_logic;
		input : in std_logic_vector((width)-1 downto 0);
		output : out std_logic_vector((width)-1 downto 0);
		sclr : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_delay_GNXF37NSAB is 

Begin

-- Delay Element, with reset value
DelayWithInit : alt_dspbuilder_SInitDelay	generic map (
				LPM_WIDTH      => 14,
				LPM_DELAY      => 1,
				SequenceLength => 1,
				SequenceValue  => "1",
				ResetValue     => "11111110110000")	
		 port map (
				dataa		=>	input,
				clock		=>	clock,
				ena   		=>	ena,
				sclr   		=>	sclr,
				aclr		=>  aclr,
				user_aclr	=>  '0',
				result		=>	output);
end architecture;