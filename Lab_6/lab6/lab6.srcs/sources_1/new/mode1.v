`timescale 1ns / 1ps

module mode1(
    input clk, // 100 Mhz clock source on Basys 3 FPGA
    input reset, // reset
    output reg [3:0] an, // anode signals of the 7-segment LED display
    output reg [6:0] sseg// cathode patterns of the 7-segment LED display
    );
    
    reg [18:0] ms_count;         // counter for generating 1 millisecond clock enable
    wire ms_enable;              // one second enable for counting numbers
    reg [8:0] displayed_number; // counting number to be displayed
    reg [3:0] LED_BCD;
    reg [20:0] refresh_count; // the first 19-bit for creating 190Hz refresh rate
                              // the other 2-bit for creating 4 LED-activating signals
    wire [1:0] LED_activating_counter; 
                 // count     0    ->  1  ->  2  ->  3
              // activates    LED1    LED2   LED3   LED4
             // and repeat
    
    //Slow 100 MHz clock in order to replicate time
    always @(posedge clk or posedge reset)
    begin
        if(reset==1)
            ms_count <= 0;
        else begin
            if(ms_count>=999999) 
                 ms_count <= 0;
            else
                ms_count <= ms_count + 1;
        end
    end 
    
    
    assign ms_enable = (ms_count==999999)?1:0;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset==1)
            displayed_number <= 0;
        else if(ms_enable==1)
            displayed_number <= displayed_number + 1;
         
            
    end
    
    
    always @(posedge clk or posedge reset)
    begin 
        if(reset==1)
            refresh_count <= 0;
        else
            refresh_count <= refresh_count + 1;
    end
    
    
    assign LED_activating_counter = refresh_count[20:19];
    
    
    // anode activating signals for 4 LEDs
    // decoder to generate anode signals 
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            an = 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = displayed_number/1000;
            // the first digit of the 16-bit number
              end
        2'b01: begin
            an = 4'b1011; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD = (displayed_number % 1000)/100;
            // the second digit of the 16-bit number
              end
        2'b10: begin
            an = 4'b1101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = ((displayed_number % 1000)%100)/10;
            // the third digit of the 16-bit number
                end
        2'b11: begin
            an = 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = ((displayed_number % 1000)%100)%10;
            // the fourth digit of the 16-bit number    
               end
        endcase
    end
    
    
    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(LED_BCD)
        4'b0000: sseg = 7'b0000001; // "0"     
        4'b0001: sseg = 7'b1001111; // "1" 
        4'b0010: sseg = 7'b0010010; // "2" 
        4'b0011: sseg = 7'b0000110; // "3" 
        4'b0100: sseg = 7'b1001100; // "4" 
        4'b0101: sseg = 7'b0100100; // "5" 
        4'b0110: sseg = 7'b0100000; // "6" 
        4'b0111: sseg = 7'b0001111; // "7" 
        4'b1000: sseg = 7'b0000000; // "8"     
        4'b1001: sseg = 7'b0000100; // "9" 
        default: sseg = 7'b0000001; // "0"
        endcase
    end
 endmodule