library verilog;
use verilog.vl_types.all;
entity fmat_alu is
    port(
        clk             : in     vl_logic;
        alu_opcode_i    : in     vl_logic_vector(3 downto 0);
        a_i             : in     vl_logic_vector(7 downto 0);
        b_i             : in     vl_logic_vector(7 downto 0);
        z_o             : out    vl_logic_vector(7 downto 0);
        ovrflw_o        : out    vl_logic
    );
end fmat_alu;
