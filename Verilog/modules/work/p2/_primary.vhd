library verilog;
use verilog.vl_types.all;
entity p2 is
    port(
        clk             : in     vl_logic;
        start_i         : in     vl_logic;
        start_addr_i    : in     vl_logic_vector(7 downto 0);
        writeEnable_o   : out    vl_logic;
        yesJump_o       : out    vl_logic;
        halt_o          : out    vl_logic;
        dataWrite_o     : out    vl_logic_vector(7 downto 0);
        instr_o         : out    vl_logic_vector(7 downto 0);
        pc_o            : out    vl_logic_vector(7 downto 0);
        regWrite_o      : out    vl_logic_vector(3 downto 0);
        target_o        : out    vl_logic_vector(7 downto 0)
    );
end p2;
