`timescale 1ns / 1ps

module time_mux_state_machine_tb;

reg clk;
reg reset;
reg [15:0] sw;
wire [3:0] an;
wire [6:0] sseg;

time_multiplex_main ul (
.clk(clk),
.reset(reset),
.sw(sw),
.an(an),
.sseg(sseg)
);

initial begin

clk = 0;
reset = 1;
sw = 16'h0000;

#10
reset = 0;
sw = 16'h0001;

#10

sw = 16'h0051;

#10

reset = 1;

#10

reset = 0;

sw = 16'h0951;

#10

sw = 16'hC951;

end

always
#5 clk = ~clk;


endmodule
