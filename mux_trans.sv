class mux_trans;
rand logic [3:0]din;
rand logic [1:0]sel;
logic out;


//constraints

constraint C1 {din inside {[0:15]};}
constraint C2 {sel dist {2'b11:=25,2'b10:=25,2'b01:=25,2'b00:=25 };}

//display
virtual function void display(input string s);

$display("---------------------------------------%s-----------------------------",s);
$display("\n din =%b",din);
$display("\nsel =%b",sel);
$display("\n out=%b",out);
$display("\n---------------------------------------------------------------------");
endfunction
endclass

