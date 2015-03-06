library verilog;
use verilog.vl_types.all;
entity fetchUnit is
    port(
        clk             : in     vl_logic;
        halt_i          : in     vl_logic;
        start_i         : in     vl_logic;
        start_addr_i    : in     vl_logic_vector(7 downto 0);
        target_i        : in     vl_logic_vector(7 downto 0);
        yesJump_i       : in     vl_logic;
        pc_o            : out    vl_logic_vector(7 downto 0)
    );
end fetchUnit;
