library verilog;
use verilog.vl_types.all;
entity add_3 is
    port(
        S               : out    vl_logic;
        C               : out    vl_logic;
        X               : in     vl_logic;
        Y               : in     vl_logic;
        Z               : in     vl_logic
    );
end add_3;
