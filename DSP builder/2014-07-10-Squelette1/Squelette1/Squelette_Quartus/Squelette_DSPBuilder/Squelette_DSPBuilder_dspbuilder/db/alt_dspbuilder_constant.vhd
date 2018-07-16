-- This file is not intended for synthesis.  The entity described in this file
-- is not directly instantiatable from HDL because its port list changes in a
-- way which is too complex to describe in VHDL or Verilog.  Please use a tool
-- such as SOPC builder, DSP builder or the Megawizard plug-in manager to
-- instantiate this entity.

--altera translate_off

entity alt_dspbuilder_constant is
end entity alt_dspbuilder_constant;

architecture rtl of alt_dspbuilder_constant is
begin

	assert false report "This file is not intended for synthesis. Please remove it from your project" severity error;

end architecture rtl;

--altera translate_on
