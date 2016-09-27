library verilog;
use verilog.vl_types.all;
entity dff is
    port(
        Q               : out    vl_logic;
        \_Q\            : out    vl_logic;
        D               : in     vl_logic;
        clk             : in     vl_logic
    );
end dff;
