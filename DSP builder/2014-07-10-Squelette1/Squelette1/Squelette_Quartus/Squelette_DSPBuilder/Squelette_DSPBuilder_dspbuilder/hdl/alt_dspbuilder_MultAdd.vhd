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

entity alt_dspbuilder_MultAdd is
	generic 	(     
					width_a					:	positive :=8;
					width_r					:	positive :=17;
					direction				:   AddSubOperator := AddAdd;
					nMult					:   positive := 2;
					intended_device_family	:	string :="Stratix";
					use_dedicated_circuitry :   natural :=0;
					representation			:   string :="SIGNED";
					regstruct				: 	registerstructure :=NoRegister					
				);
	port 		( 
					dat1aa		: in std_logic_vector (width_a-1 downto 0);
					dat1ab		: in std_logic_vector (width_a-1 downto 0);
					dat2aa		: in std_logic_vector (width_a-1 downto 0);
					dat2ab		: in std_logic_vector (width_a-1 downto 0);
					dat3aa		: in std_logic_vector (width_a-1 downto 0);
					dat3ab		: in std_logic_vector (width_a-1 downto 0);
					dat4aa		: in std_logic_vector (width_a-1 downto 0);
					dat4ab		: in std_logic_vector (width_a-1 downto 0);
					clock		: in std_logic  ;
					ena			: in std_logic  ;
					part_sclr	: in std_logic  ;
					aclr		: in std_logic  ;
                    user_aclr   : in std_logic  ;
					result		: out std_logic_vector (width_r-1 downto 0)
				);	
end alt_dspbuilder_MultAdd;

architecture MultAdd_synth of alt_dspbuilder_MultAdd is

function  RegStatus(r:registerstructure) return std_logic_vector is
	variable res : std_logic_vector(2 downto 0) :=(others=>'0');
	begin
		if ((r=InputsMultiplierandAdder)or(r=InputsOnly)or(r=InputsandMultiplier)or(r=InputsandAdder)) then 
			res(0) := '1';
		else
			res(0) := '0';
		end if;						
		if ((r=InputsMultiplierandAdder) or (r=MultiplierOnly) or (r=InputsandMultiplier) or (r=MultiplierandAdder)) then 
			res(1) := '1';
		else
			res(1) := '0';
		end if;					
	
		if (r=InputsMultiplierandAdder) or 
			(r=AdderOnly) or
			(r=InputsandAdder) or
			(r=MultiplierandAdder) then 
			res(2) := '1';
		else
			res(2) := '0';
		end if;
		return res;					
	end ;	

constant regstat		: std_logic_vector(2 downto 0) := RegStatus(regstruct);
signal regdat1aa		: std_logic_vector (width_a-1 downto 0);
signal regdat1ab		: std_logic_vector (width_a-1 downto 0);
signal regdat2aa		: std_logic_vector (width_a-1 downto 0);
signal regdat2ab		: std_logic_vector (width_a-1 downto 0);
signal regdat3aa		: std_logic_vector (width_a-1 downto 0);
signal regdat3ab		: std_logic_vector (width_a-1 downto 0);
signal regdat4aa		: std_logic_vector (width_a-1 downto 0);
signal regdat4ab		: std_logic_vector (width_a-1 downto 0);
signal A1xB				: std_logic_vector (2*width_a-1 downto 0);
signal A2xB				: std_logic_vector (2*width_a-1 downto 0);
signal A3xB				: std_logic_vector (2*width_a-1 downto 0);
signal A4xB				: std_logic_vector (2*width_a-1 downto 0);
signal A1xBSExt			: std_logic_vector (2*width_a downto 0);
signal A2xBSExt			: std_logic_vector (2*width_a downto 0);
signal A3xBSExt			: std_logic_vector (2*width_a downto 0);
signal A4xBSExt			: std_logic_vector (2*width_a downto 0);
signal FirstAdd			: std_logic_vector (2*width_a downto 0);
signal SecondAdd		: std_logic_vector (2*width_a downto 0);
signal FirstAddSExt		: std_logic_vector (2*width_a+1 downto 0);
signal SecondAddSExt	: std_logic_vector (2*width_a+1 downto 0);
signal AllZero			: std_logic_vector (2*width_a downto 0);
signal AddAll			: std_logic_vector (width_r-1 downto 0);
signal aclr_i           : std_logic;

begin

aclr_i <= aclr or user_aclr;

geab: if use_dedicated_circuitry>0 or representation = "UNSIGNED" generate
	U0:alt_dspbuilder_MultAddMF generic map	(     
						width_a		   => width_a	     ,
						width_r		   => width_r	     ,
						direction	   => direction      ,
						nMult		   => nMult	         ,
						intended_device_family => intended_device_family,
						representation => representation ,
						regstruct	   => regstruct      )
					port map	( 
						clock	       => clock  ,	
						ena		       => ena	 ,	
						aclr	       => aclr_i ,
						dat1aa	       => dat1aa ,	
						dat1ab	       => dat1ab ,	
						dat2aa	       => dat2aa ,	
						dat2ab	       => dat2ab ,	
						dat3aa	       => dat3aa ,	
						dat3ab	       => dat3ab ,	
						dat4aa	       => dat4aa ,	
						dat4ab	       => dat4ab ,	
						result	       => result );		
end generate geab;


gneab: if use_dedicated_circuitry=0 and representation /= "UNSIGNED" generate

	AllZero <= (others=>'0');
		
	gc:if (regstruct=NoRegister) generate	
		regdat1aa 	                    <= dat1aa;
		regdat1ab 	                    <= dat1ab;
		regdat2aa 	                    <= dat2aa;
		regdat2ab 	                    <= dat2ab;
		A1xB 		                    <= regdat1aa*regdat1ab;
		A1xBSExt(2*width_a-1 downto 0)	<= A1xB(2*width_a-1 downto 0);
		A1xBSExt(2*width_a)				<= A1xBSExt(2*width_a-1);
		A2xB 		                    <= regdat2aa*regdat2ab;
		A2xBSExt(2*width_a-1 downto 0)	<= A2xB(2*width_a-1 downto 0);
		A2xBSExt(2*width_a)				<= A2xBSExt(2*width_a-1);		
		result 		                    <= AddAll;		
		g2x:if (nMult=2) generate
			ga:if (direction=AddAdd) or (direction=AddSub) generate				
				AddAll <= A1xBSExt+A2xBSExt;
			end generate ga;	 
			gs:if (direction=SubSub) or (direction=SubAdd)generate
				AddAll <= A1xBSExt-A2xBSExt;
			end generate gs;	
		end generate g2x;

		g3x:if (nMult=3) generate
			regdat3aa                      <= dat3aa;
			regdat3ab                      <= dat3ab;
			A3xB                           <= regdat3aa*regdat3ab;
			A3xBSExt(2*width_a-1 downto 0) <= A3xB(2*width_a-1 downto 0);
			A3xBSExt(2*width_a)		       <= A3xBSExt(2*width_a-1);			
			ga:if (direction=AddAdd) or (direction=AddSub) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
			end generate ga;	 
			gs:if (direction=SubSub) or (direction=SubAdd)generate
				FirstAdd <= A1xBSExt-A2xBSExt;
			end generate gs;	
			SecondAdd <= AllZero+A3xBSExt;			
			FirstAddSExt(2*width_a downto 0)  <= FirstAdd(2*width_a downto 0);
			FirstAddSExt(2*width_a+1) 		  <= FirstAddSExt(2*width_a);	
			SecondAddSExt(2*width_a downto 0) <= SecondAdd(2*width_a downto 0);
			SecondAddSExt(2*width_a+1) 		  <= SecondAddSExt(2*width_a);	
			AddAll                            <= FirstAddSExt+SecondAddSExt;
		end generate g3x;
	
		g4x:if (nMult=4) generate
			regdat3aa                       <= dat3aa;
			regdat3ab                       <= dat3ab;
			regdat4aa                       <= dat4aa;
			regdat4ab                       <= dat4ab;
			A3xB                            <= regdat3aa*regdat3ab;
			A3xBSExt(2*width_a-1 downto 0)	<= A3xB(2*width_a-1 downto 0);
			A3xBSExt(2*width_a)				<= A3xBSExt(2*width_a-1);	
			A4xB                            <= regdat4aa*regdat4ab;
			A4xBSExt(2*width_a-1 downto 0)	<= A4xB(2*width_a-1 downto 0);
			A4xBSExt(2*width_a)				<= A4xBSExt(2*width_a-1);
	
			
			gaa:if (direction=AddAdd) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
				SecondAdd <= A3xBSExt+A4xBSExt;
			end generate gaa;	 
			gax:if (direction=AddSub) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
				SecondAdd <= A3xBSExt-A4xBSExt;
			end generate gax;	 
			gss:if (direction=SubSub) generate
				FirstAdd <= A1xBSExt-A2xBSExt;
				SecondAdd <= A3xBSExt-A4xBSExt;
			end generate gss;	
			gsa:if (direction=SubAdd) generate
				FirstAdd <= A1xBSExt-A2xBSExt;
				SecondAdd <= A3xBSExt+A4xBSExt;
			end generate gsa;	
	
			FirstAddSExt(2*width_a downto 0)  <= FirstAdd(2*width_a downto 0);
			FirstAddSExt(2*width_a+1) 		  <= FirstAddSExt(2*width_a);	
			SecondAddSExt(2*width_a downto 0) <= SecondAdd(2*width_a downto 0);
			SecondAddSExt(2*width_a+1) 		  <= SecondAddSExt(2*width_a);	
			AddAll                            <= FirstAddSExt+SecondAddSExt;
	
		end generate g4x;	
	end generate gc;
	
	
	gcr:if (regstruct/=NoRegister)and(regstruct/=InputsMultiplierandAdder) generate
	
		result 		<= AddAll;	
		gci:if regstat(0)='0' generate
			regdat1aa 	<= dat1aa;
			regdat1ab 	<= dat1ab;
			regdat2aa 	<= dat2aa;
			regdat2ab 	<= dat2ab;
		end generate gci;
		
		gcr:if regstat(0)='1' generate
			process(clock,aclr_i)
			begin
			    if aclr_i='1' then
			    	regdat1aa 	<= (others=>'0');
					regdat1ab 	<= (others=>'0');
					regdat2aa 	<= (others=>'0');
					regdat2ab 	<= (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						regdat1aa 	<= (others=>'0');
						regdat1ab 	<= (others=>'0');
						regdat2aa 	<= (others=>'0');
						regdat2ab 	<= (others=>'0');
					elsif (ena='1') then
						regdat1aa 	<= dat1aa;
						regdat1ab 	<= dat1ab;
						regdat2aa 	<= dat2aa;
						regdat2ab 	<= dat2ab;
					end if ;
				end if ;
			end process ;		
		end generate gcr;
		
		gmc: if regstat(1)='0' generate 	
			A1xB 		<= regdat1aa*regdat1ab;
			A2xB 		<= regdat2aa*regdat2ab;
		end generate gmc;
	
		gmr: if regstat(1)='1' generate 	
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					A1xB 		<= (others=>'0');
					A2xB 		<= (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						A1xB 		<= (others=>'0');
						A2xB 		<= (others=>'0');
					elsif (ena='1') then
						A1xB 		<= regdat1aa*regdat1ab;
						A2xB 		<= regdat2aa*regdat2ab;
					end if ;
				end if ;
			end process ;		
		end generate gmr;
	
		A1xBSExt(2*width_a-1 downto 0)	<= A1xB(2*width_a-1 downto 0);
		A1xBSExt(2*width_a)				<= A1xBSExt(2*width_a-1);
		A2xBSExt(2*width_a-1 downto 0)	<= A2xB(2*width_a-1 downto 0);
		A2xBSExt(2*width_a)				<= A2xBSExt(2*width_a-1);
			
		g2x:if (nMult=2) generate
			ga:if (direction=AddAdd) or (direction=AddSub) generate
				gac:if regstat(2)='0' generate
					AddAll <= A1xBSExt+A2xBSExt;
				end generate gac;
				gar:if regstat(2)='1' generate
					process(clock,aclr_i)
					begin
						if aclr_i='1' then
							AddAll 		<= (others=>'0');
						elsif clock'event and clock='1' then
							if (part_sclr='1') then 
								AddAll 		<= (others=>'0');
							elsif (ena='1') then
								AddAll <= A1xBSExt+A2xBSExt;
							end if ;
						end if ;
					end process ;		
				end generate gar;			
			end generate ga;	 
			gs:if (direction=SubSub) or (direction=SubAdd)generate
				gac:if regstat(2)='0' generate
					AddAll <= A1xBSExt-A2xBSExt;
				end generate gac;
				gar:if regstat(2)='1' generate
					process(clock,aclr_i)
					begin
						if aclr_i='1' then
							AddAll 		<= (others=>'0');
						elsif clock'event and clock='1' then
							if (part_sclr='1') then 
								AddAll 		<= (others=>'0');
							elsif (ena='1') then
								AddAll <= A1xBSExt-A2xBSExt;
							end if ;
						end if ;
					end process ;		
				end generate gar;			
			end generate gs;	
		end generate g2x;
	
		g3x:if (nMult=3) generate
		
			gci:if regstat(0)='0' generate
				regdat3aa <= dat3aa;
				regdat3ab <= dat3ab;
			end generate gci;
	
			gri:if regstat(0)='1' generate
				process(clock,aclr_i)
				begin
					if aclr_i='1' then
						regdat3aa <= (others=>'0');
						regdat3ab <= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							regdat3aa <= (others=>'0');
							regdat3ab <= (others=>'0');
						elsif (ena='1') then
							regdat3aa <= dat3aa;
							regdat3ab <= dat3ab;
						end if ;
					end if ;
				end process ;
			end generate gri;
	
			gmc: if regstat(1)='0' generate 	
				A3xB <= regdat3aa*regdat3ab;
			end generate gmc;
		
			gmr: if regstat(1)='1' generate 	
				process(clock,aclr_i)
				begin
					if aclr_i='1' then
						A3xB 		<= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							A3xB 		<= (others=>'0');
						elsif (ena='1') then
							A3xB <= regdat3aa*regdat3ab;
						end if ;
					end if ;
				end process ;		
			end generate gmr;
	
			A3xBSExt(2*width_a-1 downto 0)	<= A3xB(2*width_a-1 downto 0);
			A3xBSExt(2*width_a)				<= A3xBSExt(2*width_a-1);
	
			SecondAdd <= AllZero+A3xBSExt;
			
			FirstAddSExt(2*width_a downto 0) <= FirstAdd(2*width_a downto 0);
			FirstAddSExt(2*width_a+1) 		 <= FirstAddSExt(2*width_a);
	
			SecondAddSExt(2*width_a downto 0) <= SecondAdd(2*width_a downto 0);
			SecondAddSExt(2*width_a+1) 		 <= SecondAddSExt(2*width_a);
			
			ga:if (direction=AddAdd) or (direction=AddSub) generate
				FirstAdd <= A1xBSExt+A2xBSExt;	
			end generate ga;	 
		
			gs:if (direction=SubSub) or (direction=SubAdd)generate
				FirstAdd <= A1xBSExt-A2xBSExt;	
			end generate gs;	
	
			gac:if regstat(2)='0' generate
				AddAll	<= FirstAddSExt+SecondAddSExt;
			end generate gac;
	
			gar:if regstat(2)='1' generate
				process(clock,aclr_i)
				begin
					if aclr_i='1' then
						AddAll 		<= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							AddAll 		<= (others=>'0');
						elsif (ena='1') then
							AddAll	<= FirstAddSExt+SecondAddSExt;
						end if ;
					end if ;
				end process ;		
			end generate gar;
		end generate g3x;
	
		g4x:if (nMult=4) generate
	
			gci:if regstat(0)='0' generate
				regdat3aa <= dat3aa;
				regdat3ab <= dat3ab;
				regdat4aa <= dat4aa;
				regdat4ab <= dat4ab;
			end generate gci;
	
			gri:if regstat(0)='1' generate
				process(clock,aclr_i)
				begin
					if aclr_i='1' then
						regdat3aa <= (others=>'0');
						regdat3ab <= (others=>'0');
						regdat4aa <=  (others=>'0');
						regdat4ab <=  (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							regdat3aa <= (others=>'0');
							regdat3ab <= (others=>'0');
							regdat4aa <=  (others=>'0');
							regdat4ab <=  (others=>'0');
						elsif (ena='1') then
							regdat3aa <= dat3aa;
							regdat3ab <= dat3ab;
							regdat4aa <= dat4aa;
							regdat4ab <= dat4ab;
						end if ;
					end if ;
				end process ;				
			end generate gri;
	
			gmc: if regstat(1)='0' generate 	
				A3xB <= regdat3aa*regdat3ab;
				A4xB <= regdat4aa*regdat4ab;
			end generate gmc;
		
			gmr: if regstat(1)='1' generate 	
				process(clock,aclr_i)
				begin
					if aclr_i='1' then
						A3xB 		<= (others=>'0');
						A4xB 		<= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							A3xB 		<= (others=>'0');
							A4xB 		<= (others=>'0');
						elsif (ena='1') then
							A3xB <= regdat3aa*regdat3ab;
							A4xB <= regdat4aa*regdat4ab;
						end if ;
					end if ;
				end process ;		
			end generate gmr;
	
			A3xBSExt(2*width_a-1 downto 0)	<= A3xB(2*width_a-1 downto 0);
			A3xBSExt(2*width_a)				<= A3xBSExt(2*width_a-1);
	
			A4xBSExt(2*width_a-1 downto 0)	<= A4xB(2*width_a-1 downto 0);
			A4xBSExt(2*width_a)				<= A4xBSExt(2*width_a-1);
			
			gaa:if (direction=AddAdd) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
				SecondAdd <= A3xBSExt+A4xBSExt;
			end generate gaa;	 
			gax:if (direction=AddSub) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
				SecondAdd <= A3xBSExt-A4xBSExt;
			end generate gax;	 
			gss:if (direction=SubSub) generate
				FirstAdd <= A1xBSExt-A2xBSExt;
				SecondAdd <= A3xBSExt-A4xBSExt;
			end generate gss;	
			gsa:if (direction=SubAdd) generate
				FirstAdd <= A1xBSExt-A2xBSExt;
				SecondAdd <= A3xBSExt+A4xBSExt;
			end generate gsa;	
	
			FirstAddSExt(2*width_a downto 0) <= FirstAdd(2*width_a downto 0);
			FirstAddSExt(2*width_a+1) 		 <= FirstAddSExt(2*width_a);
	
			SecondAddSExt(2*width_a downto 0) <= SecondAdd(2*width_a downto 0);
			SecondAddSExt(2*width_a+1) 		 <= SecondAddSExt(2*width_a);
	
			gac:if regstat(2)='0' generate
				AddAll	<= FirstAddSExt+SecondAddSExt;
			end generate gac;
	
			gar:if regstat(2)='1' generate
				process(clock,aclr_i)
				begin
				    if aclr_i='1' then
				    	AddAll 		<= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							AddAll 		<= (others=>'0');
						elsif (ena='1') then
							AddAll	<= FirstAddSExt+SecondAddSExt;
						end if ;
					end if ;
				end process ;		
			end generate gar;
		end generate g4x;
	end generate gcr;
	
	gr:if (regstruct=InputsMultiplierandAdder) generate
	
		result 		<= AddAll;
		
		process(clock,aclr_i)
		begin
			if aclr_i='1' then
				regdat1aa 	<= (others=>'0');
				regdat1ab 	<= (others=>'0');
				regdat2aa 	<= (others=>'0');
				regdat2ab 	<= (others=>'0');
			elsif clock'event and clock='1' then
				if (part_sclr='1') then 
					regdat1aa 	<= (others=>'0');
					regdat1ab 	<= (others=>'0');
					regdat2aa 	<= (others=>'0');
					regdat2ab 	<= (others=>'0');
				elsif (ena='1') then
					regdat1aa 	<= dat1aa;
					regdat1ab 	<= dat1ab;
					regdat2aa 	<= dat2aa;
					regdat2ab 	<= dat2ab;
				end if ;
			end if ;
		end process ;		
		
		process(clock,aclr_i)
		begin
			if aclr_i='1' then
				A1xB 		<= (others=>'0');
				A2xB 		<= (others=>'0');
			elsif clock'event and clock='1' then
				if (part_sclr='1') then 
					A1xB 		<= (others=>'0');
					A2xB 		<= (others=>'0');
				elsif (ena='1') then
					A1xB 		<= regdat1aa*regdat1ab;
					A2xB 		<= regdat2aa*regdat2ab;
				end if ;
			end if ;
		end process ;		
	
		A1xBSExt(2*width_a-1 downto 0)	<= A1xB(2*width_a-1 downto 0);
		A1xBSExt(2*width_a)				<= A1xBSExt(2*width_a-1);
		A2xBSExt(2*width_a-1 downto 0)	<= A2xB(2*width_a-1 downto 0);
		A2xBSExt(2*width_a)				<= A2xBSExt(2*width_a-1);
			
		g2x:if (nMult=2) generate
			ga:if (direction=AddAdd) or (direction=AddSub) generate
				process(clock,aclr_i)
				begin
				 	if aclr_i='1' then
				 		AddAll 		<= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							AddAll 		<= (others=>'0');
						elsif (ena='1') then
							AddAll <= A1xBSExt+A2xBSExt;
						end if ;
					end if ;
				end process ;		
			end generate ga;	 
			gs:if (direction=SubSub) or (direction=SubAdd)generate
				process(clock,aclr_i)
				begin
					if aclr_i='1' then
						AddAll 		<= (others=>'0');
					elsif clock'event and clock='1' then
						if (part_sclr='1') then 
							AddAll 		<= (others=>'0');
						elsif (ena='1') then
							AddAll <= A1xBSExt-A2xBSExt;
						end if ;
					end if ;
				end process ;		
			end generate gs;	
		end generate g2x;
	
		g3x:if (nMult=3) generate
		
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					regdat3aa <= (others=>'0');
					regdat3ab <= (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						regdat3aa <= (others=>'0');
						regdat3ab <= (others=>'0');
					elsif (ena='1') then
						regdat3aa <= dat3aa;
						regdat3ab <= dat3ab;
					end if ;
				end if ;
			end process ;
		
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					A3xB 		<= (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						A3xB 		<= (others=>'0');
					elsif (ena='1') then
						A3xB <= regdat3aa*regdat3ab;
					end if ;
				end if ;
			end process ;		
	
			A3xBSExt(2*width_a-1 downto 0)	<= A3xB(2*width_a-1 downto 0);
			A3xBSExt(2*width_a)				<= A3xBSExt(2*width_a-1);
	
			SecondAdd <= AllZero+A3xBSExt;
			
			FirstAddSExt(2*width_a downto 0) <= FirstAdd(2*width_a downto 0);
			FirstAddSExt(2*width_a+1) 		 <= FirstAddSExt(2*width_a);
	
			SecondAddSExt(2*width_a downto 0) <= SecondAdd(2*width_a downto 0);
			SecondAddSExt(2*width_a+1) 		 <= SecondAddSExt(2*width_a);
			
			ga:if (direction=AddAdd) or (direction=AddSub) generate
				FirstAdd <= A1xBSExt+A2xBSExt;	
			end generate ga;	 
		
			gs:if (direction=SubSub) or (direction=SubAdd)generate
				FirstAdd <= A1xBSExt-A2xBSExt;	
			end generate gs;	
	
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					AddAll 		<= (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						AddAll 		<= (others=>'0');
					elsif (ena='1') then
						AddAll	<= FirstAddSExt+SecondAddSExt;
					end if ;
				end if ;
			end process ;		
		end generate g3x;
	
		g4x:if (nMult=4) generate
	
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					regdat3aa <= (others=>'0');
					regdat3ab <= (others=>'0');
					regdat4aa <=  (others=>'0');
					regdat4ab <=  (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						regdat3aa <= (others=>'0');
						regdat3ab <= (others=>'0');
						regdat4aa <=  (others=>'0');
						regdat4ab <=  (others=>'0');
					elsif (ena='1') then
						regdat3aa <= dat3aa;
						regdat3ab <= dat3ab;
						regdat4aa <= dat4aa;
						regdat4ab <= dat4ab;
					end if ;
				end if ;
			end process ;				
	
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					A3xB 		<= (others=>'0');
					A4xB 		<= (others=>'0');	
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						A3xB 		<= (others=>'0');
						A4xB 		<= (others=>'0');
					elsif (ena='1') then
						A3xB <= regdat3aa*regdat3ab;
						A4xB <= regdat4aa*regdat4ab;
					end if ;
				end if ;
			end process ;		
	
			A3xBSExt(2*width_a-1 downto 0)	<= A3xB(2*width_a-1 downto 0);
			A3xBSExt(2*width_a)				<= A3xBSExt(2*width_a-1);
	
			A4xBSExt(2*width_a-1 downto 0)	<= A4xB(2*width_a-1 downto 0);
			A4xBSExt(2*width_a)				<= A4xBSExt(2*width_a-1);
			
			gaa:if (direction=AddAdd) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
				SecondAdd <= A3xBSExt+A4xBSExt;
			end generate gaa;	 
			gax:if (direction=AddSub) generate
				FirstAdd <= A1xBSExt+A2xBSExt;
				SecondAdd <= A3xBSExt-A4xBSExt;
			end generate gax;	 
			gss:if (direction=SubSub) generate
				FirstAdd <= A1xBSExt-A2xBSExt;
				SecondAdd <= A3xBSExt-A4xBSExt;
			end generate gss;	
			gsa:if (direction=SubAdd) generate
				FirstAdd <= A1xBSExt-A2xBSExt;
				SecondAdd <= A3xBSExt+A4xBSExt;
			end generate gsa;	
	
			FirstAddSExt(2*width_a downto 0) <= FirstAdd(2*width_a downto 0);
			FirstAddSExt(2*width_a+1) 		 <= FirstAddSExt(2*width_a);
	
			SecondAddSExt(2*width_a downto 0) <= SecondAdd(2*width_a downto 0);
			SecondAddSExt(2*width_a+1) 		 <= SecondAddSExt(2*width_a);
	
			process(clock,aclr_i)
			begin
				if aclr_i='1' then
					AddAll 		<= (others=>'0');
				elsif clock'event and clock='1' then
					if (part_sclr='1') then 
						AddAll 		<= (others=>'0');
					elsif (ena='1') then
						AddAll	<= FirstAddSExt+SecondAddSExt;
					end if ;
				end if ;
			end process ;		
		end generate g4x;
	end generate gr;
end generate gneab;


end MultAdd_synth;



