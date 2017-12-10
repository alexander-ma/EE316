`timescale 1ns / 1ps

module part1_tb;

reg clk;
reg call;
reg cancel;

wire light;

part1 ul (
    .clk(clk),
    .call(call),
    .cancel(cancel),
    .light(light)
    );
    
initial
begin

clk = 0;
call = 0;
cancel = 0;

#10;

call = 1;
cancel = 0;

#10;

call = 0;
cancel = 1;

#10;

call = 1;
cancel = 1;

#10;

call = 0;
cancel = 0;

#10;

call = 1;
cancel = 0;

#10

cancel = 1;

#20;

cancel = 0;

#20;

call = 0;
cancel = 1;

#20;

call = 0;
cancel = 0;

end

always
#5 clk = ~clk;

endmodule
