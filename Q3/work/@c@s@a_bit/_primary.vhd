library verilog;
use verilog.vl_types.all;
entity CSA_bit is
    generic(
        W               : integer := 1
    );
    port(
        S               : out    vl_logic_vector;
        C               : out    vl_logic_vector;
        X               : in     vl_logic_vector;
        Y               : in     vl_logic_vector;
        Z               : in     vl_logic_vector
    );
end CSA_bit;
