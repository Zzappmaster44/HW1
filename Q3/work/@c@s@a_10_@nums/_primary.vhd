library verilog;
use verilog.vl_types.all;
entity CSA_10_Nums is
    port(
        SUM             : out    vl_logic_vector(15 downto 0);
        CARRY           : out    vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        C               : in     vl_logic_vector(7 downto 0);
        D               : in     vl_logic_vector(7 downto 0);
        E               : in     vl_logic_vector(7 downto 0);
        F               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        H               : in     vl_logic_vector(7 downto 0);
        I               : in     vl_logic_vector(7 downto 0);
        J               : in     vl_logic_vector(7 downto 0)
    );
end CSA_10_Nums;
