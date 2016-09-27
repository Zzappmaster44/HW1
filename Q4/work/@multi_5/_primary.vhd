library verilog;
use verilog.vl_types.all;
entity Multi_5 is
    port(
        P               : out    vl_logic_vector(9 downto 0);
        A               : in     vl_logic_vector(4 downto 0);
        B               : in     vl_logic_vector(4 downto 0)
    );
end Multi_5;
