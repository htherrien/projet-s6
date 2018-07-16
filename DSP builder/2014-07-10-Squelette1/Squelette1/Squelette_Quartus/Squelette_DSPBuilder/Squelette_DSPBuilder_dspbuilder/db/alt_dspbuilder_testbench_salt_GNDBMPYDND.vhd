library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
library std;
use std.textio.all;
entity alt_dspbuilder_testbench_salt_GNDBMPYDND is
	generic		( 			XFILE : string := "default");

	port(
		clock : in std_logic;
		aclr : in std_logic;
		output : out std_logic);		
end entity;

  

architecture rtl of alt_dspbuilder_testbench_salt_GNDBMPYDND is 
function to_std_logic (B: character) return std_logic is
	begin
		case B is
			when '0' => return '0';
			when '1' => return '1';
			when OTHERS => return 'X';
		end case;
	end;

function to_std_logic_vector (B: string) return
	std_logic_vector is
	variable res: std_logic_vector (B'range);
	begin
		for i in B'range loop
			case B(i) is
				when '0' => res(i) := '0';
				when '1' => res(i) := '1';
				when OTHERS => res(i) := 'X';
			end case;
		end loop;
		return res;
	end;

procedure skip_type_header(file f:text) is
      use STD.textio.all;
      variable in_line : line; 
	begin
     readline(f, in_line);
	end procedure skip_type_header ;
 
file InputFile 	: text open read_mode is XFILE;	

Begin
-- salt generator

skip_type_header(InputFile);

-- Reading Simulink Input
	Input_pInput:process(clock, aclr)
	variable s	  	: string(1 to 1) ;
	variable ptr		: line ;
	begin
		if (aclr = '1') then
			            output <= '0';
			        elsif (not endfile(InputFile)) then
            if clock'event and clock='0' then
                readline(Inputfile, ptr);
                read(ptr, s);
			                    output <= to_std_logic(s(1));
			    			end if ;
		end if ;
	end process ;

end architecture;
 