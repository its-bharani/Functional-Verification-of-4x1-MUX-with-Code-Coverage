class mux_gen;

rand int num = 10;//for test case 2 num=60
mailbox #(mux_trans)gen2drv;

function new(mailbox #(mux_trans)gen2drv);
        this.gen2drv=gen2drv;
endfunction

task run();
mux_trans t;
repeat(num)begin
t=new();
assert(t.randomize());
gen2drv.put(t);
end
endtask
endclass
~
