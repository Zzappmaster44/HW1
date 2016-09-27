library verilog;
use verilog.vl_types.all;
entity CLA_4bit is
    port(
        SUM             : out    vl_logic_vector(3 downto 0);
        cOut            : out    vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        cIn             : in     vl_logic
    );
end CLA_4bit;
