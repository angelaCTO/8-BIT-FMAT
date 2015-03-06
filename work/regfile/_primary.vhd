library verilog;
use verilog.vl_types.all;
entity regfile is
    generic(
        DATA_WIDTH      : integer := 8;
        REGISTER_FILE_WIDTH: integer := 16
    );
    port(
        clk             : in     vl_logic;
        regRead1_i      : in     vl_logic_vector(3 downto 0);
        regRead2_i      : in     vl_logic_vector(3 downto 0);
        regRead3_i      : in     vl_logic_vector(3 downto 0);
        regRead4_i      : in     vl_logic_vector(3 downto 0);
        writeEnable_i   : in     vl_logic;
        regWrite_i      : in     vl_logic_vector(3 downto 0);
        dataWrite_i     : in     vl_logic_vector(7 downto 0);
        ovrflw_i        : in     vl_logic;
        dataRead1_o     : out    vl_logic_vector(7 downto 0);
        dataRead2_o     : out    vl_logic_vector(7 downto 0);
        dataRead3_o     : out    vl_logic_vector(7 downto 0);
        dataRead4_o     : out    vl_logic_vector(7 downto 0);
        ovrflw_o        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_FILE_WIDTH : constant is 1;
end regfile;
