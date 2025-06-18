class ref_model;

mailbox #(mux_trans) ref_in;
mailbox #(mux_trans) expected_out;

function new(mailbox #(mux_trans) ref_in,
mailbox #(mux_trans) expected_out);
this.ref_in=ref_in;
this.expected_out=expected_out;
endfunction

task run();
mux_trans in,out;

forever begin

ref_in.get(in);
out=new();
out.sel=in.sel;
out.din=in.din;
out.out=in.din[in.sel];
expected_out.put(out);
end
endtask
endclass
