
interface mux_if();
logic [3:0]din;
logic [1:0]sel;
logic out;
endinterface

package mux_pkg;
`include "mux_trans.sv"
`include "mux_gen.sv"
`include "mux_drv.sv"
`include "write_mon.sv"
`include "read_mon.sv"
`include "ref_model.sv"
`include "scoreboard.sv"
`include "env.sv"
endpackage

module mux_test();
import mux_pkg::*;

mux_if mif();
mux4x1 dut(.sel(mif.sel),.din(mif.din),.out(mif.out));

env e;
initial begin
        e=new(mif);
        e.run();
#50;
$finish;
end
endmodule
~
