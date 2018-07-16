--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: © 2001 Altera Corporation. All rights reserved.  Your use of Altera 
-- Corporation's design tools, logic functions and other software and tools, and its 
-- AMPP partner logic functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any associated 
-- documentation or information are expressly subject to the terms and conditions 
-- of the Altera Program License Subscription Agreement, Altera MegaCore Function 
-- License Agreement, or other applicable license agreement, including, without 
-- limitation, that your use is for the sole purpose of programming logic devices 
-- manufactured by Altera and sold by Altera or its authorized distributors.  
-- Please refer to the applicable agreement for further details.
--------------------------------------------------------------------------------------------


library ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

library altera;
use altera.alt_dspbuilder_package.all;


library LPM;
use LPM.LPM_COMPONENTS.all;

entity alt_dspbuilder_AltMultConst is
	generic 	(     
					CA				:	std_logic_vector :="10";
					CB				:	std_logic_vector :="0010";
					CC				:	std_logic_vector :="10010";
					CD				:	std_logic_vector :="1000001011111111111111";
					width_a			:	positive :=8;
					width_r			:	positive :=17;					
					regstruct		: 	registerstructure :=NoRegister;
                                        data_signed             :       boolean := true					
				);
	port 		( 
						datain			: in std_logic_vector (width_a-1 downto 0);
						datbin			: in std_logic_vector (width_a-1 downto 0);
						datcin			: in std_logic_vector (width_a-1 downto 0);
						datdin			: in std_logic_vector (width_a-1 downto 0);
						dataout			: out std_logic_vector (width_r-1 downto 0);
						clock			: in std_logic  := '1';
						ena				: in std_logic  := '1';
						sclr			: in std_logic  := '0';
						aclr			: in std_logic  := '0';
                        user_aclr       : in std_logic
				);
end alt_dspbuilder_AltMultConst;


architecture AltMultConst_synth of alt_dspbuilder_AltMultConst is

function  MaxInt(a:integer ; b:integer) return integer is
variable i : integer;
begin
	if (a>b) then
		i := a;
	else
		i := b;
	end if ;
	return i;
end MaxInt;

constant wadda  : integer := MaxInt(datain'high+CA'high+1,datbin'high+CB'high+1)+1; 
constant waddb  : integer := MaxInt(datcin'high+CC'high+1,datdin'high+CD'high+1)+1; 
constant wres	: integer := MaxInt(wadda,waddb)+1; 

signal C0		: std_logic_vector(CA'high downto 0) := CA(0 to CA'high); 
signal C1		: std_logic_vector(CB'high downto 0) := CB(0 to CB'high); 
signal C2		: std_logic_vector(CC'high downto 0) := CC(0 to CC'high); 
signal C3		: std_logic_vector(CD'high downto 0) := CD(0 to CD'high); 

signal	dataint	: std_logic_vector (datain'high downto 0);
signal	datbint	: std_logic_vector (datbin'high downto 0);
signal	datcint	: std_logic_vector (datcin'high downto 0);
signal	datdint	: std_logic_vector (datdin'high downto 0);

signal AC0		: std_logic_vector(datain'high+CA'high+1 downto 0) ; 
signal BC1		: std_logic_vector(datbin'high+CB'high+1 downto 0) ; 
signal CC2		: std_logic_vector(datcin'high+CC'high+1 downto 0) ; 
signal DC3		: std_logic_vector(datdin'high+CD'high+1 downto 0) ; 

signal AC0EXT		: std_logic_vector(wadda downto 0) ; 
signal BC1EXT		: std_logic_vector(wadda downto 0) ; 
signal CC2EXT		: std_logic_vector(waddb downto 0) ; 
signal DC3EXT		: std_logic_vector(waddb downto 0) ; 

signal adda			: std_logic_vector(wadda downto 0) ; 
signal addb			: std_logic_vector(waddb downto 0) ; 

signal addaEXT		: std_logic_vector(wres downto 0) ; 
signal addbEXT		: std_logic_vector(wres downto 0) ; 
signal result		: std_logic_vector(wres downto 0) ; 

signal aclr_i		: std_logic;

begin

	aclr_i <= aclr or user_aclr;
	
	C0	<= CA(0 to CA'high); 
	C1	<= CB(0 to CB'high); 
	C2	<= CC(0 to CC'high); 
	C3	<= CD(0 to CD'high); 

	AC0EXT(datain'high+CA'high+1 downto 0) <= AC0(datain'high+CA'high+1 downto 0);
	gAC0EXT:for i in datain'high+CA'high+2 to wadda generate 
                gAC0EXT_s: if (data_signed) generate
		        AC0EXT(i) <= AC0EXT(datain'high+CA'high+1);
                end generate;
                gAC0EXT_u: if not(data_signed) generate
		        AC0EXT(i) <= '0';
                end generate;
	end generate ;

	BC1EXT(datbin'high+CB'high+1 downto 0) <= BC1(datbin'high+CB'high+1 downto 0);
	gBC1EXT:for i in datbin'high+CB'high+2 to wadda generate 
                gBC1EXT_s: if (data_signed) generate
        		BC1EXT(i) <= BC1EXT(datbin'high+CB'high+1);
                end generate;
                gBC1EXT_u: if not(data_signed) generate
        		BC1EXT(i) <= '0';
                end generate;
	end generate ;

	CC2EXT(datcin'high+CC'high+1 downto 0) <= CC2(datcin'high+CC'high+1 downto 0);
	gCC2EXT:for i in datcin'high+CC'high+2 to waddb generate 
                gCC2EXT_s: if (data_signed) generate
        		CC2EXT(i) <= CC2EXT(datcin'high+CC'high+1);
                end generate;
                gCC2EXT_u: if not(data_signed) generate
        		CC2EXT(i) <= '0';
                end generate;
	end generate ;

	DC3EXT(datcin'high+CD'high+1 downto 0) <= DC3(datcin'high+CD'high+1 downto 0);
	gDC3EXT:for i in datcin'high+CD'high+2 to waddb generate 
                gDC3EXT_s: if (data_signed) generate
        		DC3EXT(i) <= DC3EXT(datcin'high+CD'high+1);
                end generate;
                gDC3EXT_u: if not(data_signed) generate
        		DC3EXT(i) <= '0';
                end generate;
	end generate ;
	

	addaEXT(wadda downto 0) <= adda(wadda downto 0);
	gaddaEXT:for i in wadda+1 to wres generate 
                gaddaEXT_s: if (data_signed) generate
        		addaEXT(i) <= adda(wadda);
                end generate;
                gaddaEXT_u: if not(data_signed) generate
        		addaEXT(i) <= '0';
                end generate;
	end generate ;

	addbEXT(waddb downto 0) <= addb(waddb downto 0);
	gaddbEXT:for i in waddb+1 to wres generate 
                gaddbEXT_s: if (data_signed) generate
        		addbEXT(i) <= addb(waddb);
                end generate;
                gaddbEXT_u: if not(data_signed) generate
        		addbEXT(i) <= '0';
                end generate;
	end generate ;

	gr:if (wres<dataout'high) generate
		dataout(wres downto 0) <= result(wres downto 0);
		grr: for i in wres+1 to dataout'high generate
                        grr_s: if (data_signed) generate
        			dataout(i) <= result(wres);
                        end generate grr_s;
                        grr_u: if not(data_signed) generate
        			dataout(i) <= '0';
                        end generate grr_u;
		end generate grr;		
	end generate gr;

	gnr:if not(wres<dataout'high) generate
		dataout(dataout'high downto 0) <= result(dataout'high downto 0);
	end generate gnr;

	
	gnr1: if ((regstruct=NoRegister)or (regstruct=MultiplierOnly) or (regstruct=AdderOnly) or (regstruct=MultiplierandAdder)) generate

		dataint <= datain;
		datbint <= datbin;
		datcint <= datcin;
		datdint <= datdin;

	end generate gnr1;

	gr1: if ((regstruct=InputsOnly)or (regstruct=InputsandMultiplier) or (regstruct=InputsandAdder) or (regstruct=InputsMultiplierandAdder)) generate
		process(clock,aclr_i)
			begin
                if aclr_i='1' then
                    dataint <= (others=>'0');
					datbint <= (others=>'0');
					datcint <= (others=>'0');
					datdint <= (others=>'0');
				elsif clock'event and clock='1' then
					if (sclr='1') then 
						dataint <= (others=>'0');
						datbint <= (others=>'0');
						datcint <= (others=>'0');
						datdint <= (others=>'0');
					elsif (ena='1') then
						dataint <= datain;
						datbint <= datbin;
						datcint <= datcin;
						datdint <= datdin;
					end if ;
				end if ;
		end process ;		
	end generate gr1;


	gnr2: if ((regstruct=NoRegister)or (regstruct=InputsOnly) or (regstruct=AdderOnly) or (regstruct=InputsandAdder)) generate
                gnr2_s: if (data_signed) generate
		        AC0  <= C0*dataint;
		        BC1  <= C1*datbint;
		        CC2  <= C2*datcint;
		        DC3  <= C3*datdint;
                end generate gnr2_s;
                
                gnr2_u: if not(data_signed) generate
		        AC0  <= unsigned(C0)*unsigned(dataint);
		        BC1  <= unsigned(C1)*unsigned(datbint);
		        CC2  <= unsigned(C2)*unsigned(datcint);
		        DC3  <= unsigned(C3)*unsigned(datdint);
                end generate gnr2_u;
	
	end generate gnr2;

	gr2: if ((regstruct=MultiplierOnly)or (regstruct=InputsandMultiplier) or (regstruct=MultiplierandAdder) or (regstruct=InputsMultiplierandAdder)) generate
        gr2_s: if (data_signed) generate
		process(clock,aclr_i)
			begin
                if aclr_i='1' then
				    AC0  <= (others=>'0');
					BC1  <= (others=>'0');
					CC2  <= (others=>'0');
					DC3  <=(others=>'0');	
                elsif clock'event and clock='1' then
					if (sclr='1') then 
						AC0  <= (others=>'0');
						BC1  <= (others=>'0');
						CC2  <= (others=>'0');
						DC3  <=(others=>'0');						
					elsif (ena='1') then
						AC0  <= C0*dataint;
						BC1  <= C1*datbint;
						CC2  <= C2*datcint;
						DC3  <= C3*datdint;
					end if ;
				end if ;
		end process ;
        end generate gr2_s;
        gr2_u: if not(data_signed) generate
		process(clock,aclr_i)
			begin
                if aclr_i='1' then
				    AC0  <= (others=>'0');
					BC1  <= (others=>'0');
					CC2  <= (others=>'0');
					DC3  <=(others=>'0');	
                elsif clock'event and clock='1' then
					if (sclr='1') then 
						AC0  <= (others=>'0');
						BC1  <= (others=>'0');
						CC2  <= (others=>'0');
						DC3  <=(others=>'0');						
					elsif (ena='1') then
						AC0  <= unsigned(C0)*unsigned(dataint);
						BC1  <= unsigned(C1)*unsigned(datbint);
						CC2  <= unsigned(C2)*unsigned(datcint);
						DC3  <= unsigned(C3)*unsigned(datdint);
					end if ;
				end if ;
		end process ;
        end generate gr2_u;
	end generate gr2;

	adda 	<= AC0EXT+BC1EXT;
	addb 	<= CC2EXT+DC3EXT;

	gnr3: if ((regstruct=NoRegister)or (regstruct=InputsOnly) or (regstruct=MultiplierOnly) or (regstruct=InputsandMultiplier)) generate
		result  <= addaEXT+addbEXT;
	end generate gnr3;

	gr3: if ((regstruct=AdderOnly)or (regstruct=InputsandAdder) or (regstruct=MultiplierandAdder) or (regstruct=InputsMultiplierandAdder)) generate
		process(clock,aclr_i)
			begin
                if aclr_i='1' then
                    result  <= (others=>'0');
				elsif clock'event and clock='1' then
					if (sclr='1') then 
						result  <= (others=>'0');
					elsif (ena='1') then
						result  <= addaEXT+addbEXT;
					end if ;
				end if ;
		end process ;		
	end generate gr3;
		
end AltMultConst_synth;


