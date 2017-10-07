`timescale 1ns / 1ps

module tb_LED_Display;
    reg a;
    reg b;
    reg c;
    reg d;
    wire z0;
    wire z1;
    wire z2;
    wire z3;
    wire z4;
    wire z5;
    wire z6;
    
    LED_Display uut (
            .a(a),
            .b(b),
            .c(c),
            .d(d),
            .z0(z0),
            .z1(z1),
            .z2(z2),
            .z3(z3),
            .z4(z4),
            .z5(z5),
            .z6(z6)
    );
    
    initial begin
    #50;        // initial wait
    
    // Iterate through all values 0-9
    
    a = 1'b0;
    b = 1'b0;
    c = 1'b0;
    d = 1'b0;
    #50;
    
    a = 1'b0;
    b = 1'b0;
    c = 1'b0;
    d = 1'b1;
    #50;
    
    a = 1'b0;
    b = 1'b0;
    c = 1'b1;
    d = 1'b0;
    #50;
    
    a = 1'b0;
    b = 1'b0;
    c = 1'b1;
    d = 1'b1;
    #50;
    
    a = 1'b0;
    b = 1'b1;
    c = 1'b0;
    d = 1'b0;
    #50;
    
    a = 1'b0;
    b = 1'b1;
    c = 1'b0;
    d = 1'b1;
    #50;
    a = 1'b0;
    b = 1'b1;
    c = 1'b1;
    d = 1'b0;
    #50;
    
    a = 1'b0;
    b = 1'b1;
    c = 1'b1;
    d = 1'b1;
    #50;
    
    a = 1'b1;
    b = 1'b0;
    c = 1'b0;
    d = 1'b0;
    #50;
    
    a = 1'b1;
    b = 1'b0;
    c = 1'b0;
    d = 1'b1;
    #50;
    
    // All other numbers must show nothing on the display, ie. out = 8'b11111111
    a = 1'b1;
    b = 1'b0;
    c = 1'b1;
    d = 1'b0;
    #50;
    
    a = 1'b1;
    b = 1'b0;
    c = 1'b1;
    d = 1'b1;
    #50;
    
    a = 1'b1;
    b = 1'b1;
    c = 1'b0;
    d = 1'b0;
    #50;
    
    a = 1'b1;
    b = 1'b1;
    c = 1'b0;
    d = 1'b1;
    #50;
    
    a = 1'b1;
    b = 1'b1;
    c = 1'b1;
    d = 1'b0;
    #50;
    
    a = 1'b1;
    b = 1'b1;
    c = 1'b1;
    d = 1'b1;
    #50;
    
    end
                                
endmodule