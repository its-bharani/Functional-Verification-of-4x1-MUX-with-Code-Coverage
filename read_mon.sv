class read_mon;
virtual mux_if vif;
mailbox #(mux_trans)actual_out;

function new(virtual mux_if vif,
mailbox #(mux_trans)actual_out);
        this.vif=vif;
        this.actual_out=actual_out;
endfunction

task run();
mux_trans t;
forever begin
t=new();
t.sel=vif.sel;
t.din=vif.din;
#1;
t.out=vif.out;
actual_out.put(t);
end
endtask
endclass
