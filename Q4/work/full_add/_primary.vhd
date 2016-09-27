library verilog;
use verilog.vl_types.all;
entity full_add is
    port(
        sum             : out    vl_logic;
        cOut            : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        cIn             : in     vl_logic
    );
end full_add;
