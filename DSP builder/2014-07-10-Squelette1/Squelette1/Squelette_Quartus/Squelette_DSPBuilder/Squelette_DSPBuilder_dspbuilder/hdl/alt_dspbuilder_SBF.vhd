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



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_SBF is
	generic 	(     
					width_inl		: natural :=10;
					width_inr		: natural :=10;
					width_outl	    : natural :=8;
					width_outr	    : natural :=8;
					round		    : natural :=1;
					satur		    : natural :=1;
					lpm_signed	    : BusArithm :=BusIsSigned
				);
	port 		( 
					xin				: in std_logic_vector(width_inl+width_inr-1 downto 0);
					yout			: out std_logic_vector(width_outl+width_outr-1 downto 0)
				);	
end alt_dspbuilder_SBF;

architecture SBF_SYNTH of alt_dspbuilder_SBF is

	signal youtround 		: std_logic_vector(width_inl+width_outr-1 downto 0);
	signal youtroundc 		: std_logic_vector(width_outl+width_outr-1 downto 0);
	signal xinextc 			: std_logic_vector(width_outl+width_inr-1 downto 0) ;
	signal xin_int          : std_logic_vector(width_inl+width_inr-1 downto 0);

begin

	u0: alt_dspbuilder_sAltrPropagate generic map(QTB=>DSPBuilderQTB, QTB_PRODUCT => DSPBuilderProduct, QTB_VERSION => DSPBuilderVersion , width=> width_inl+width_inr)
	                   port map   (d => xin, r => xin_int);

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--(width_inl>=width_outl) and (width_inr>=width_outr)
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	sbf_a:if (width_inl>=width_outl) and (width_inr>=width_outr) generate
		gnsnr:if (round = 0) generate

			gnsat:if (satur=0) generate
				gl:for i in 0 to width_outl+width_outr-1 generate
					yout(i) <= xin_int(i+width_inr-width_outr);
				end generate ;
			end generate gnsat;
			
			gsat:if (satur>0) generate

				gl:for i in 0 to width_inl+width_outr-1 generate
					youtround(i) <= xin_int(i+width_inr-width_outr);
				end generate ;	
				
				us:alt_dspbuilder_ASAT
						generic map 	( 	widthin		=> width_inl+width_outr,  
										widthout		=> width_outl+width_outr,
										lpm_signed 	=> lpm_signed)
						port 	map		( 	xin			=> youtround,
										yout			=> yout);
			end generate gsat;			
		end generate ;

		rnd:if (round>0)generate
			ura:alt_dspbuilder_AROUND 
					generic map 	( 	widthin		=> width_inl+width_inr,  
									widthout		=> width_inl+width_outr)
					port 	map		( 	xin			=> xin_int,
									yout			=> youtround);
			gns:if satur=0 generate
				yout(width_outl+width_outr-1 downto 0) <= 	youtround(width_outl+width_outr-1 downto 0);			
			end generate gns;			
			gs:if 	(satur>0) generate
				us:alt_dspbuilder_ASAT
						generic map 	( 	widthin	=> width_inl+width_outr,  
										widthout	=> width_outl+width_outr,
										lpm_signed 	=> lpm_signed)
						port 	map		( 	xin		=> youtround,
										yout		=> yout
									);
			end generate gs;
		end generate rnd;

	end generate sbf_a;

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- (width_inl>width_outl) and (width_inr<width_outr)
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	sbf_b:if (width_inl>=width_outl) and (width_inr<width_outr) generate
		ns:if (satur=0) generate
			gc:for i in 0 to width_outr-width_inr-1 generate
				yout(i) <= '0';
			end generate gc;
			gl:for i in width_outr-width_inr to width_outl+width_outr-1 generate
				yout(i) <= xin_int(i+width_inr-width_outr);
			end generate ;
		end generate ns ;
		
		gs:if (satur>0) generate
			gc:for i in 0 to width_outr-width_inr-1 generate
				youtround(i) <= '0';
			end generate gc;
			gl:for i in width_outr-width_inr to width_inl+width_outr-1 generate
				youtround(i) <= xin_int(i+width_inr-width_outr);
			end generate ;
			us:alt_dspbuilder_ASAT
				generic map 	( 	widthin	=> width_inl+width_outr,  
								widthout	=> width_outl+width_outr,
								lpm_signed => lpm_signed)
				port 	map		( 	xin		=> youtround,
								yout		=> yout);
		end generate gs ;
	end generate sbf_b;

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- (width_inl<width_outl) and (width_inr>width_outr)
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	sbf_c:if (width_inl<width_outl) and (width_inr>=width_outr) generate
		gnsnr:if (round = 0) generate
			gl:for i in 0 to width_inl+width_outr-1 generate
				yout(i) <= xin_int(i+width_inr-width_outr);
			end generate ;	
			gc:for i in 	width_inl+width_outr to width_outl+width_outr-1 generate
				yout(i) <= xin_int( width_inl+width_inr-1); 
			end generate ;
		end generate ;		
		rnd:if (round > 0) generate

			xinextc(width_inl+width_inr-1 downto 0) <= xin_int(width_inl+width_inr-1 downto 0);
			gxinextc:for i in width_inl+width_inr to width_outl+width_inr-1 generate
				xinextc(i) <= xin_int(width_inl+width_inr-1);
			end generate gxinextc;
		
			urb:alt_dspbuilder_AROUND 
					generic map 	( 	widthin	=> width_outl+width_inr,  
									widthout	=> width_outl+width_outr)
					port 	map		( 	xin		=> xinextc,
									yout		=> youtroundc);
			yout <= youtroundc;
		end generate rnd ;
	end generate sbf_c;

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--  (width_inl<width_outl) and (width_inr<width_outr)
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	sbf_d:if (width_inl<width_outl) and (width_inr<width_outr) generate
		gl:for i in width_outr-width_inr to width_inl+width_outr-1 generate
			yout(i) <= xin_int(i+width_inr-width_outr);
		end generate gl;
		gc:for i in 0 to width_outr-width_inr-1 generate
			yout(i) <= '0';
		end generate gc;		
		gcv:for i in width_inl+width_outr to width_outl+width_outr-1 generate
			yout(i) <= xin_int( width_inl+width_inr-1); 
		end generate gcv;		
	end generate sbf_d;

end SBF_SYNTH;


