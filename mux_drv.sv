class mux_drv;

        virtual mux_if vif;
        mailbox #(mux_trans)gen2drv;
        mailbox #(mux_trans)drv2mon;

function new(virtual mux_if vif,
        mailbox #(mux_trans)gen2drv,
        mailbox #(mux_trans)drv2mon);
        this.vif=vif;
        this.gen2drv=gen2drv;
        this.drv2mon=drv2mon;
endfunction
task run();
mux_trans t;
forever begin

gen2drv.get(t);
vif.sel=t.sel;
vif.din=t.din;
#1;
drv2mon.put(t);
end
endtask
endclass
