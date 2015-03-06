library verilog;
use verilog.vl_types.all;
entity regfile is
    generic(
        DATA_WIDTH      : integer := 8;
        REGISTER_FILE_WIDTH: integer := 16
    );
    port(
        clk             : in     vl_logic;
        writeEnable_i   : in     vl_logic;
        regWrite_i      : in     vl_logic_vector(3 downto 0);
        dataWrite_i     : in     vl_logic_vector(7 downto 0);
        ovrflw_i        : in     vl_logic;
        register0_o     : out    vl_logic_vector(7 downto 0);
        register1_o     : out    vl_logic_vector(7 downto 0);
        register2_o     : out    vl_logic_vector(7 downto 0);
        register3_o     : out    vl_logic_vector(7 downto 0);
        register4_o     : out    vl_logic_vector(7 downto 0);
        register5_o     : out    vl_logic_vector(7 downto 0);
        register6_o     : out    vl_logic_vector(7 downto 0);
        register7_o     : out    vl_logic_vector(7 downto 0);
        registerN_o     : out    vl_logic;
        registerR_o     : out    vl_logic_vector(3 downto 0);
        registerF_o     : out    vl_logic_vector(1 downto 0);
        registerCL_o    : out    vl_logic_vector(3 downto 0);
        registerCR_o    : out    vl_logic_vector(7 downto 0);
        registerJ0_o    : out    vl_logic_vector(7 downto 0);
        registerJ1_o    : out    vl_logic_vector(7 downto 0);
        registerJ2_o    : out    vl_logic_vector(7 downto 0);
        registerJ3_o    : out    vl_logic_vector(7 downto 0);
        registerO_o     : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of REGISTER_FILE_WIDTH : constant is 1;
end regfile;
