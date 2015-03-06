library verilog;
use verilog.vl_types.all;
entity fetchUnit is
    port(
        clk             : in     vl_logic;
        flush_i         : in     vl_logic;
        start_i         : in     vl_logic;
        start_addr_i    : in     vl_logic_vector(7 downto 0);
        branch_i        : in     vl_logic;
        taken_i         : in     vl_logic;
        target_i        : in     vl_logic_vector(7 downto 0);
        instr_o         : out    vl_logic_vector(7 downto 0)
    );
end fetchUnit;
