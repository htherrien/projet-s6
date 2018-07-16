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
entity alt_dspbuilder_testbench_capture_GNXQSSLPCC is
	generic		( 			XFILE : string := "default";
			DSPBTYPE : string := "");

	port(
		clock : in std_logic;
		aclr : in std_logic;
		input : in std_logic_vector(13 downto 0));		
end entity;

  

architecture rtl of alt_dspbuilder_testbench_capture_GNXQSSLPCC is 

  function str(sl: std_logic) return character is
    variable c: character;
    begin
	 	 case sl is
	     	when  '0' =>  c := '0';
	     	when  '1' =>  c := '1';
	     	when others => c := 'X';
	     end case;   
        return c;
   end str;
   
   
   function str(slv: std_logic_vector) return string is
	     variable result : string (1 to slv'length);
	     variable r : integer;
	   begin
	     r := 1;
	     for i in slv'range loop
	     	result(r) := str(slv(i));

	        r := r + 1;
	     end loop;
	     return result;
	   end str;
	   
  procedure write_type_header(file f:text) is
      use STD.textio.all;
      variable my_line : line; 
  	begin
      write ( my_line, DSPBTYPE);
      writeline ( f, my_line );
 	end procedure write_type_header ;
  
file oFile 	: text open write_mode is XFILE;

Begin
-- data capture
-- write type information to output file
write_type_header(oFile);

-- Writing Output Signal into file
	Output:process(clock)		
		variable traceline		: line ;
		begin	
			if (aclr ='1') then
				-- do not record 
			elsif clock'event and clock='1' then
				write(traceline, str(input),justified=>left);
				writeline(oFile,traceline);
			end if ;		
		end process ;		
end architecture;
 