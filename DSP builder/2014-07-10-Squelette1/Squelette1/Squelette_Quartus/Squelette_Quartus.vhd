-- Quartus II VHDL Template

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;








entity Squelette_Quartus is --mettre meme nom que le fichier ici

	port 
	(
		Clock_50MHz		: in std_logic;
		LEDR : out std_logic_vector (9 downto 0); 
		SWITCH : in std_logic_vector(9 downto 0);
		BUTTON : in std_logic_vector(3 downto 0);
		DAC_mode : out std_logic; 
		DAC0_clock : out std_logic;
		DAC0_data : out std_logic_vector(13 downto 0);
		DAC0_wrta : out std_logic;
		DAC1_clock : out std_logic;
		DAC1_data : out std_logic_vector(13 downto 0);
		DAC1_wrta : out std_logic;
		debug_0_out : out std_logic;
		debug_1_out : out std_logic;
		debug_2_out : out std_logic
	);

end entity;
















architecture main of Squelette_Quartus is
	component PLL_0002 is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			outclk_1 : out std_logic;        -- clk
			outclk_2 : out std_logic;        -- clk
			outclk_3 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
	end component PLL_0002;
	
	
	component Squelette_DSPBuilder_GN is
	port (
		Clock_125MHz : in std_logic;
		Clock_2MHz : in std_logic;
		Clock_50MHz : in std_logic;
		Clock_62p5MHz : in std_logic;
		Output_DAC0 : out std_logic_vector(14-1 downto 0);
		Output_test : out std_logic;
		aclr : in std_logic;
		aclr_125 : in std_logic;
		aclr_2 : in std_logic;
		aclr_62p5 : in std_logic;
		modulateur_bit_a_transmettre : in std_logic;
		modulateur_bitclock_i : in std_logic;
		modulateur_bitclock_q : in std_logic;
		modulateur_enable : in std_logic
	);
	end component Squelette_DSPBuilder_GN;



	signal counter_heartbeat : unsigned (21 downto 0);
	signal counter_reset : unsigned (10 downto 0) := "00000000000";
	signal counter_bitPeriod : unsigned (7 downto 0) := "00000000";
	signal pseudoRandomNumberGenerator : bit_vector(15 downto 0) := "1100000010100111";
	
	signal pllClock_125MHz : std_logic;
	signal pllClock_62p5MHz : std_logic;
	signal pllClock_10MHz : std_logic;
	signal pllClock_2MHz : std_logic;
	
	signal dspbuilder_Output_DAC0 : std_logic_vector(13 downto 0);

	signal bitclk_i : std_logic;
	signal bitclk_q : std_logic;
	signal bit_a_transmettre : std_logic;
	
	
	
	
	
	
	
	
	
	
	
	
	
begin

	pll_inst : component PLL_0002
		port map (
			refclk   => Clock_50MHz,   --  refclk.clk
			rst      => '0',      --   reset.reset
			outclk_0 => pllClock_125MHz, -- outclk0.clk
			outclk_1 => pllClock_62p5MHz, -- outclk1.clk
			outclk_2 => pllClock_10MHz, -- outclk2.clk
			outclk_3 => pllClock_2MHz -- outclk3.clk
			--locked   => locked    --  locked.export
		);
		
	dspbuilder_inst: Squelette_DSPBuilder_GN
	port map (
		Clock_125MHz => pllClock_125MHz,
		Clock_2MHz => pllClock_2MHz,
		Clock_50MHz => Clock_50MHz,
		Clock_62p5MHz => pllClock_62p5MHz,
		Output_DAC0 => dspbuilder_Output_DAC0,
		aclr => counter_reset(10),
		aclr_125 => counter_reset(10),
		aclr_2 => counter_reset(10),
		aclr_62p5 => counter_reset(10),
		modulateur_bit_a_transmettre => bit_a_transmettre,
		modulateur_bitclock_i => bitclk_i,
		modulateur_bitclock_q => bitclk_q,
		modulateur_enable => BUTTON(1),
		Output_test => debug_2_out
	);
		
		
	DAC_mode <= '1';	
	DAC0_data(12 downto 0) <= dspbuilder_Output_DAC0(12 downto 0);
	DAC0_data(13) <= not dspbuilder_Output_DAC0(13);
	DAC0_wrta <= pllClock_125MHz;
	DAC0_clock <= pllClock_125MHz;
	
	
	process(pllClock_10MHz)
	begin
		if(rising_edge(pllClock_10MHz)) then
			counter_heartbeat <= counter_heartbeat + "1"; 
		end if; 
	end process;
	
	process(Clock_50MHz)
	begin
		if(rising_edge(Clock_50MHz)) then
			if (counter_reset < "10000000000") then
				counter_reset <= counter_reset + "1"; 
			end if;
		end if; 
	end process;

	process(pllClock_125MHz)
	begin
		if(rising_edge(pllClock_125MHz)) then
			case counter_bitPeriod is
				when "11111001" =>
					counter_bitPeriod <= "00000000";
					bitclk_i <= '1'; 
					pseudoRandomNumberGenerator (15 downto 0) <= (pseudoRandomNumberGenerator(15 downto 0) rol 1);
				when "01111101" =>
					counter_bitPeriod <= counter_bitPeriod + "1";
					bitclk_i <= '1'; 
					pseudoRandomNumberGenerator (15 downto 0) <= (pseudoRandomNumberGenerator(15 downto 0) rol 1);
				when "00111110" =>
					counter_bitPeriod <= counter_bitPeriod + "1";
					bitclk_q <= '1'; 
					pseudoRandomNumberGenerator (15 downto 0) <= (pseudoRandomNumberGenerator(15 downto 0) rol 1);
				when "10111011" =>
					counter_bitPeriod <= counter_bitPeriod + "1";
					bitclk_q <= '1'; 
					pseudoRandomNumberGenerator (15 downto 0) <= (pseudoRandomNumberGenerator(15 downto 0) rol 1);
				when others => 
					counter_bitPeriod <= counter_bitPeriod + "1"; 
					bitclk_i <= '0'; 
					bitclk_q <= '0'; 
			end case;
			
		if(pseudoRandomNumberGenerator(15) = '1') then
			bit_a_transmettre <= '1';
		else
			bit_a_transmettre <= '0';	
		end if;

		end if; 

	end process;
	
	debug_0_out <= bitclk_i;
	debug_1_out <= bit_a_transmettre;
	--debug_2_out <= bit_a_transmettre;
	

	
	LEDR(9) <= counter_heartbeat(21); 
end main;