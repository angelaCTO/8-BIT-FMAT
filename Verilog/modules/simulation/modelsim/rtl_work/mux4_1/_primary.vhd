library verilog;
use verilog.vl_types.all;
entity mux4_1 is
    port(
        a_i             : in     vl_logic_vector(7 downto 0);
        b_i             : in     vl_logic_vector(7 downto 0);
        c_i             : in     vl_logic_vector(7 downto 0);
        d_i             : in     vl_logic_vector(7 downto 0);
        sig_i           : in     vl_logic_vector(1 downto 0);
        res_o           : out    vl_logic_vector(7 downto 0)
    );
end mux4_1;
