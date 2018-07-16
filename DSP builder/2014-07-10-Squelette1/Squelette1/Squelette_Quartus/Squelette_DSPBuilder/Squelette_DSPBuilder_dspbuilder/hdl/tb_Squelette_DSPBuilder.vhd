-- tb_Squelette_DSPBuilder.vhd

-- Generated using ACDS version 14.0 200 at 2014.07.10.07:25:37

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Squelette_DSPBuilder is
end entity tb_Squelette_DSPBuilder;

architecture rtl of tb_Squelette_DSPBuilder is
	component Squelette_DSPBuilder_GN is
		port (
			Clock_50MHz                  : in  std_logic                     := 'X'; -- clk
			aclr                         : in  std_logic                     := 'X'; -- reset_n
			Clock_125MHz                 : in  std_logic                     := 'X'; -- clk
			aclr_125                     : in  std_logic                     := 'X'; -- reset_n
			Clock_2MHz                   : in  std_logic                     := 'X'; -- clk
			aclr_2                       : in  std_logic                     := 'X'; -- reset_n
			Clock_62p5MHz                : in  std_logic                     := 'X'; -- clk
			aclr_62p5                    : in  std_logic                     := 'X'; -- reset_n
			modulateur_bitclock_i        : in  std_logic                     := 'X'; -- wire
			Output_test                  : out std_logic;                            -- wire
			modulateur_bitclock_q        : in  std_logic                     := 'X'; -- wire
			modulateur_bit_a_transmettre : in  std_logic                     := 'X'; -- wire
			modulateur_enable            : in  std_logic                     := 'X'; -- wire
			Output_DAC0                  : out std_logic_vector(13 downto 0)         -- wire
		);
	end component Squelette_DSPBuilder_GN;

	component alt_dspbuilder_testbench_clock_GNCGUFKHRR is
		generic (
			SIMULATION_START_CYCLE       : natural := 4;
			RESET_LATENCY                : natural := 0;
			RESET_REGISTER_CASCADE_DEPTH : natural := 0
		);
		port (
			aclr_out     : out std_logic;  -- reset
			clock_out    : out std_logic;  -- clk
			reg_aclr_out : out std_logic;  -- reset
			tb_aclr      : out std_logic   -- reset
		);
	end component alt_dspbuilder_testbench_clock_GNCGUFKHRR;

	component alt_dspbuilder_testbench_clock_GNSAS6FNZP is
		generic (
			SIMULATION_START_CYCLE       : natural := 4;
			RESET_LATENCY                : natural := 0;
			RESET_REGISTER_CASCADE_DEPTH : natural := 0
		);
		port (
			aclr_out     : out std_logic;  -- reset
			clock_out    : out std_logic;  -- clk
			reg_aclr_out : out std_logic;  -- reset
			tb_aclr      : out std_logic   -- reset
		);
	end component alt_dspbuilder_testbench_clock_GNSAS6FNZP;

	component alt_dspbuilder_testbench_clock_GNB4F5J4FW is
		generic (
			SIMULATION_START_CYCLE       : natural := 4;
			RESET_LATENCY                : natural := 0;
			RESET_REGISTER_CASCADE_DEPTH : natural := 0
		);
		port (
			aclr_out     : out std_logic;  -- reset
			clock_out    : out std_logic;  -- clk
			reg_aclr_out : out std_logic;  -- reset
			tb_aclr      : out std_logic   -- reset
		);
	end component alt_dspbuilder_testbench_clock_GNB4F5J4FW;

	component alt_dspbuilder_testbench_clock_GN3JWMVXTD is
		generic (
			SIMULATION_START_CYCLE       : natural := 4;
			RESET_LATENCY                : natural := 0;
			RESET_REGISTER_CASCADE_DEPTH : natural := 0
		);
		port (
			aclr_out     : out std_logic;  -- reset
			clock_out    : out std_logic;  -- clk
			reg_aclr_out : out std_logic;  -- reset
			tb_aclr      : out std_logic   -- reset
		);
	end component alt_dspbuilder_testbench_clock_GN3JWMVXTD;

	component alt_dspbuilder_testbench_salt_GNDBMPYDND is
		generic (
			XFILE : string := "default"
		);
		port (
			clock  : in  std_logic := 'X'; -- clk
			aclr   : in  std_logic := 'X'; -- reset
			output : out std_logic         -- wire
		);
	end component alt_dspbuilder_testbench_salt_GNDBMPYDND;

	component alt_dspbuilder_testbench_capture_GNQX2JTRTZ is
		generic (
			XFILE    : string := "default";
			DSPBTYPE : string := ""
		);
		port (
			clock : in std_logic := 'X'; -- clk
			aclr  : in std_logic := 'X'; -- reset
			input : in std_logic := 'X'  -- wire
		);
	end component alt_dspbuilder_testbench_capture_GNQX2JTRTZ;

	component alt_dspbuilder_testbench_capture_GNXQSSLPCC is
		generic (
			XFILE    : string := "default";
			DSPBTYPE : string := ""
		);
		port (
			clock : in std_logic                     := 'X';             -- clk
			aclr  : in std_logic                     := 'X';             -- reset
			input : in std_logic_vector(13 downto 0) := (others => 'X')  -- wire
		);
	end component alt_dspbuilder_testbench_capture_GNXQSSLPCC;

	signal salt_modulateur_bitclock_i_output_wire        : std_logic;                     -- salt_modulateur_bitclock_i:output -> dut:modulateur_bitclock_i
	signal clock_50mhz_clock_tb_reset                    : std_logic;                     -- Clock_50MHz:tb_aclr -> [salt_modulateur_bitclock_i:aclr, salt_modulateur_bitclock_q:aclr, salt_modulateur_enable:aclr]
	signal clock_50mhz_clock_tb_clk                      : std_logic;                     -- Clock_50MHz:clock_out -> [dut:Clock_50MHz, salt_modulateur_bitclock_i:clock, salt_modulateur_bitclock_q:clock, salt_modulateur_enable:clock]
	signal salt_modulateur_bitclock_q_output_wire        : std_logic;                     -- salt_modulateur_bitclock_q:output -> dut:modulateur_bitclock_q
	signal salt_modulateur_bit_a_transmettre_output_wire : std_logic;                     -- salt_modulateur_bit_a_transmettre:output -> dut:modulateur_bit_a_transmettre
	signal clock_125mhz_clock_tb_reset                   : std_logic;                     -- Clock_125MHz:tb_aclr -> salt_modulateur_bit_a_transmettre:aclr
	signal clock_125mhz_clock_tb_clk                     : std_logic;                     -- Clock_125MHz:clock_out -> [capture_Output_DAC0:clock, capture_Output_test:clock, dut:Clock_125MHz, salt_modulateur_bit_a_transmettre:clock]
	signal salt_modulateur_enable_output_wire            : std_logic;                     -- salt_modulateur_enable:output -> dut:modulateur_enable
	signal dut_output_test_wire                          : std_logic;                     -- dut:Output_test -> capture_Output_test:input
	signal clock_125mhz_clock_reg_reset_reset            : std_logic;                     -- Clock_125MHz:reg_aclr_out -> [capture_Output_DAC0:aclr, capture_Output_test:aclr]
	signal dut_output_dac0_wire                          : std_logic_vector(13 downto 0); -- dut:Output_DAC0 -> capture_Output_DAC0:input
	signal clock_50mhz_clock_output_reset                : std_logic;                     -- Clock_50MHz:aclr_out -> clock_50mhz_clock_output_reset:in
	signal clock_125mhz_clock_output_reset               : std_logic;                     -- Clock_125MHz:aclr_out -> clock_125mhz_clock_output_reset:in
	signal clock_2mhz_clock_output_reset                 : std_logic;                     -- Clock_2MHz:aclr_out -> clock_2mhz_clock_output_reset:in
	signal clock_2mhz_clock_output_clk                   : std_logic;                     -- Clock_2MHz:clock_out -> dut:Clock_2MHz
	signal clock_62p5mhz_clock_output_reset              : std_logic;                     -- Clock_62p5MHz:aclr_out -> clock_62p5mhz_clock_output_reset:in
	signal clock_62p5mhz_clock_output_clk                : std_logic;                     -- Clock_62p5MHz:clock_out -> dut:Clock_62p5MHz
	signal clock_50mhz_clock_output_reset_ports_inv      : std_logic;                     -- clock_50mhz_clock_output_reset:inv -> dut:aclr
	signal clock_125mhz_clock_output_reset_ports_inv     : std_logic;                     -- clock_125mhz_clock_output_reset:inv -> dut:aclr_125
	signal clock_2mhz_clock_output_reset_ports_inv       : std_logic;                     -- clock_2mhz_clock_output_reset:inv -> dut:aclr_2
	signal clock_62p5mhz_clock_output_reset_ports_inv    : std_logic;                     -- clock_62p5mhz_clock_output_reset:inv -> dut:aclr_62p5

begin

	dut : component Squelette_DSPBuilder_GN
		port map (
			Clock_50MHz                  => clock_50mhz_clock_tb_clk,                      --                  Clock_50MHz.clk
			aclr                         => clock_50mhz_clock_output_reset_ports_inv,      --                             .reset_n
			Clock_125MHz                 => clock_125mhz_clock_tb_clk,                     --                 Clock_125MHz.clk
			aclr_125                     => clock_125mhz_clock_output_reset_ports_inv,     --                             .reset_n
			Clock_2MHz                   => clock_2mhz_clock_output_clk,                   --                   Clock_2MHz.clk
			aclr_2                       => clock_2mhz_clock_output_reset_ports_inv,       --                             .reset_n
			Clock_62p5MHz                => clock_62p5mhz_clock_output_clk,                --                Clock_62p5MHz.clk
			aclr_62p5                    => clock_62p5mhz_clock_output_reset_ports_inv,    --                             .reset_n
			modulateur_bitclock_i        => salt_modulateur_bitclock_i_output_wire,        --        modulateur_bitclock_i.wire
			Output_test                  => dut_output_test_wire,                          --                  Output_test.wire
			modulateur_bitclock_q        => salt_modulateur_bitclock_q_output_wire,        --        modulateur_bitclock_q.wire
			modulateur_bit_a_transmettre => salt_modulateur_bit_a_transmettre_output_wire, -- modulateur_bit_a_transmettre.wire
			modulateur_enable            => salt_modulateur_enable_output_wire,            --            modulateur_enable.wire
			Output_DAC0                  => dut_output_dac0_wire                           --                  Output_DAC0.wire
		);

	clock_50mhz : component alt_dspbuilder_testbench_clock_GNCGUFKHRR
		generic map (
			SIMULATION_START_CYCLE       => 200,
			RESET_LATENCY                => 0,
			RESET_REGISTER_CASCADE_DEPTH => 0
		)
		port map (
			clock_out    => clock_50mhz_clock_tb_clk,       --        clock_tb.clk
			tb_aclr      => clock_50mhz_clock_tb_reset,     --                .reset
			aclr_out     => clock_50mhz_clock_output_reset, --    clock_output.reset
			reg_aclr_out => open                            -- clock_reg_reset.reset
		);

	clock_62p5mhz : component alt_dspbuilder_testbench_clock_GNSAS6FNZP
		generic map (
			SIMULATION_START_CYCLE       => 250,
			RESET_LATENCY                => 0,
			RESET_REGISTER_CASCADE_DEPTH => 0
		)
		port map (
			clock_out    => clock_62p5mhz_clock_output_clk,   --        clock_tb.clk
			tb_aclr      => open,                             --                .reset
			aclr_out     => clock_62p5mhz_clock_output_reset, --    clock_output.reset
			reg_aclr_out => open                              -- clock_reg_reset.reset
		);

	clock_2mhz : component alt_dspbuilder_testbench_clock_GNB4F5J4FW
		generic map (
			SIMULATION_START_CYCLE       => 8,
			RESET_LATENCY                => 0,
			RESET_REGISTER_CASCADE_DEPTH => 0
		)
		port map (
			clock_out    => clock_2mhz_clock_output_clk,   --        clock_tb.clk
			tb_aclr      => open,                          --                .reset
			aclr_out     => clock_2mhz_clock_output_reset, --    clock_output.reset
			reg_aclr_out => open                           -- clock_reg_reset.reset
		);

	clock_125mhz : component alt_dspbuilder_testbench_clock_GN3JWMVXTD
		generic map (
			SIMULATION_START_CYCLE       => 500,
			RESET_LATENCY                => 0,
			RESET_REGISTER_CASCADE_DEPTH => 0
		)
		port map (
			clock_out    => clock_125mhz_clock_tb_clk,          --        clock_tb.clk
			tb_aclr      => clock_125mhz_clock_tb_reset,        --                .reset
			aclr_out     => clock_125mhz_clock_output_reset,    --    clock_output.reset
			reg_aclr_out => clock_125mhz_clock_reg_reset_reset  -- clock_reg_reset.reset
		);

	salt_modulateur_bitclock_i : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Squelette%5FDSPBuilder_modulateur%5Fbitclock%5Fi.salt"
		)
		port map (
			clock  => clock_50mhz_clock_tb_clk,               -- clock_aclr.clk
			aclr   => clock_50mhz_clock_tb_reset,             --           .reset
			output => salt_modulateur_bitclock_i_output_wire  --     output.wire
		);

	salt_modulateur_bitclock_q : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Squelette%5FDSPBuilder_modulateur%5Fbitclock%5Fq.salt"
		)
		port map (
			clock  => clock_50mhz_clock_tb_clk,               -- clock_aclr.clk
			aclr   => clock_50mhz_clock_tb_reset,             --           .reset
			output => salt_modulateur_bitclock_q_output_wire  --     output.wire
		);

	salt_modulateur_bit_a_transmettre : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Squelette%5FDSPBuilder_modulateur%5Fbit%5Fa%5Ftransmettre.salt"
		)
		port map (
			clock  => clock_125mhz_clock_tb_clk,                     -- clock_aclr.clk
			aclr   => clock_125mhz_clock_tb_reset,                   --           .reset
			output => salt_modulateur_bit_a_transmettre_output_wire  --     output.wire
		);

	salt_modulateur_enable : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Squelette%5FDSPBuilder_modulateur%5Fenable.salt"
		)
		port map (
			clock  => clock_50mhz_clock_tb_clk,           -- clock_aclr.clk
			aclr   => clock_50mhz_clock_tb_reset,         --           .reset
			output => salt_modulateur_enable_output_wire  --     output.wire
		);

	capture_output_test : component alt_dspbuilder_testbench_capture_GNQX2JTRTZ
		generic map (
			XFILE    => "Squelette%5FDSPBuilder_Output%5Ftest.capture.msim",
			DSPBTYPE => "BIT [1, 0]"
		)
		port map (
			clock => clock_125mhz_clock_tb_clk,          -- clock_aclr.clk
			aclr  => clock_125mhz_clock_reg_reset_reset, --           .reset
			input => dut_output_test_wire                --      input.wire
		);

	capture_output_dac0 : component alt_dspbuilder_testbench_capture_GNXQSSLPCC
		generic map (
			XFILE    => "Squelette%5FDSPBuilder_Output%5FDAC0.capture.msim",
			DSPBTYPE => "INT [14, 0]"
		)
		port map (
			clock => clock_125mhz_clock_tb_clk,          -- clock_aclr.clk
			aclr  => clock_125mhz_clock_reg_reset_reset, --           .reset
			input => dut_output_dac0_wire                --      input.wire
		);

	clock_50mhz_clock_output_reset_ports_inv <= not clock_50mhz_clock_output_reset;

	clock_125mhz_clock_output_reset_ports_inv <= not clock_125mhz_clock_output_reset;

	clock_2mhz_clock_output_reset_ports_inv <= not clock_2mhz_clock_output_reset;

	clock_62p5mhz_clock_output_reset_ports_inv <= not clock_62p5mhz_clock_output_reset;

end architecture rtl; -- of tb_Squelette_DSPBuilder
