class write_mon;

virtual mux_if vif;
mailbox #(mux_trans)drv2mon;
mailbox #(mux_trans)mon2score;

function new(virtual mux_if vif,
mailbox #(mux_trans)drv2mon,
mailbox #(mux_trans)mon2score);
        this.vif=vif;
        this.drv2mon=drv2mon;
        this.mon2score=mon2score;
endfunction

task run();
mux_trans t;
forever begin
drv2mon.get(t);
#1
t.out=vif.out;
mon2score.put(t);
end
endtask
endclass
