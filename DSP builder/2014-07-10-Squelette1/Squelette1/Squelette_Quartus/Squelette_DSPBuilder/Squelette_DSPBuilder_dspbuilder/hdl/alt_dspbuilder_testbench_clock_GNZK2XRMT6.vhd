library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;

entity alt_dspbuilder_testbench_clock_GNZK2XRMT6 is
	generic		( 			SIMULATION_START_CYCLE : natural := 4;
			RESET_LATENCY : natural := 0;
			RESET_REGISTER_CASCADE_DEPTH : natural := 0);

	port(
		aclr_out : out std_logic;
		clock_out : out std_logic;
		reg_aclr_out : out std_logic;
		tb_aclr : out std_logic);		
end entity;

architecture rtl of alt_dspbuilder_testbench_clock_GNZK2XRMT6 is 

    function alt_dspbuilder_testbench_clock_GNZK2XRMT6_offset_generate (
        latency, cascade_depth: integer)
        return integer is
    begin
        if latency > cascade_depth then
            return latency - cascade_depth;
        else
            return 0;
        end if;
    end function alt_dspbuilder_testbench_clock_GNZK2XRMT6_offset_generate;
    
    constant cPERIOD : time := 16.666666666666668 ns;
    constant cPHASE_DELAY : time := 0 fs;
    constant cINITIAL_CLOCK : std_logic := '1';
    constant offset : integer := alt_dspbuilder_testbench_clock_GNZK2XRMT6_offset_generate(RESET_LATENCY, RESET_REGISTER_CASCADE_DEPTH);

Begin
-- clock generator
    -- We want to start simulation after 4 cycles.
    
    -- Start the salt generators 1 period early as they are read on falling edges
    -- take into account any extra registering of resets that need to be compensated for in the msim testbench flow
	tb_aclr <= '1', '0' after  (SIMULATION_START_CYCLE + RESET_LATENCY) * cPERIOD + cPHASE_DELAY - cPERIOD;	
	
	-- Start the system 1/2 a period early so it is ready on the next edge
    -- we may need to offset this by the difference in the DUT reset latency (needed to align this reset correctly)
    -- from the actual latency present in the reset synchronization circuitry
    -- so the actual hardware comes out of reset exactly when the data capture elements (using reg_aclr_out)
    -- are switched 'on'
    aclr_out <= '1', '0' after (SIMULATION_START_CYCLE + offset) * cPERIOD + cPHASE_DELAY - cPERIOD/2;
	-- potentially delayed reset signal - delayed to hide any extra latency due to registered reset signal
	-- this signal should be hooked up to data capture elements
	-- will be identical to above system reset in default (unregistered) reset case
	reg_aclr_out <= '1', '0' after (SIMULATION_START_CYCLE + RESET_LATENCY)* cPERIOD + cPHASE_DELAY  - cPERIOD/2;	

	GEN_CLK: process
	begin
		wait for cPHASE_DELAY;
		loop
			clock_out <= cINITIAL_CLOCK;
			wait for cPERIOD/2;
			clock_out <= not cINITIAL_CLOCK;
			wait for cPERIOD/2;			
		end loop;
	end process GEN_CLK;

end architecture;