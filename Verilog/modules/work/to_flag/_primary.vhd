library verilog;
use verilog.vl_types.all;
entity to_flag is
    port(
        input_i         : in     vl_logic_vector(7 downto 0);
        output_o        : out    vl_logic
    );
end to_flag;
