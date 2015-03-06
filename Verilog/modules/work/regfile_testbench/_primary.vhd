library verilog;
use verilog.vl_types.all;
entity regfile_testbench is
    generic(
        DATA_WIDTH      : integer := 8;
        ADDR_WIDTH      : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end regfile_testbench;
