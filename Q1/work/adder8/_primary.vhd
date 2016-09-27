library verilog;
use verilog.vl_types.all;
entity adder8 is
    port(
        sum             : out    vl_logic_vector(7 downto 0);
        cOut            : out    vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        cIn             : in     vl_logic
    );
end adder8;
