`timescale 1ns / 1ps

module even_odd_conseq00_tb();

reg clk, reset_n, x;
    wire y;

    even_odd_conseq00 uut(
        .clk(clk),
        .x(x),
        .reset_n(reset_n),
        .y(y)
    );
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial 
    begin
        reset_n = 1'b0;
        x = 1'b1;
        @(negedge clk);
        reset_n = 1'b1;
        
            x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T
        $finish;
    end
    
    

endmodule
