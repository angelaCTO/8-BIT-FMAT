library verilog;
use verilog.vl_types.all;
entity inst_rom is
    port(
        pc_i            : in     vl_logic_vector(7 downto 0);
        instr_o         : out    vl_logic_vector(7 downto 0)
    );
end inst_rom;
