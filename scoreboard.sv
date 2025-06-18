class scoreboard;

mailbox #(mux_trans)expected_out;
mailbox #(mux_trans)actual_out;

function new(mailbox #(mux_trans)expected_out,
mailbox #(mux_trans)actual_out);

this.expected_out=expected_out;
this.actual_out=actual_out;
endfunction


task run();
mux_trans exp,act;
forever begin
expected_out.get(exp);
actual_out.get(act);
if(exp.out===act.out)
$display("pass -----sel=%b,din=%b,-------------out=%b",act.sel,act.din,act.out);
else
$display("fail ---sel=%b,din=%b,---------actual out=%b----expected-out=%b",act.sel,act.din,act.out,exp.out);

end
endtask
endclass
