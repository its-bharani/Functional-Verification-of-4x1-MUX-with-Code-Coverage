class env;
mux_gen g;
mux_drv d;
write_mon wm;
read_mon rm;
ref_model refm;
scoreboard sb;

mailbox #(mux_trans)gen2drv;
mailbox #(mux_trans)drv2mon;
mailbox #(mux_trans)ref2sb;
mailbox #(mux_trans)act2sb;

virtual mux_if vif;

function new(virtual mux_if vif);
this.vif=vif;

gen2drv=new();
drv2mon=new();
ref2sb=new();
act2sb=new();

g=new(gen2drv);
d=new(vif,gen2drv,drv2mon);
wm=new(vif,drv2mon,ref2sb);
rm=new(vif,act2sb);
refm=new(ref2sb,ref2sb);
sb=new(ref2sb,act2sb);

endfunction


task run();
fork
g.run();
d.run();
wm.run();
rm.run();
refm.run();
sb.run();
join_any
endtask
endclass
