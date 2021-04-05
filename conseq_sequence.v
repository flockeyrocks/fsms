`timescale 1ns / 1ps

module conseq_sequence(
input clk,
    input reset_n,
    input x,
    output y
    );
    
    reg [2:0] state_reg, state_next;
    localparam s0 = 0;
    localparam s1 = 1;
    localparam s2 = 2;
    localparam s3 = 3;
    localparam s4 = 4;
    localparam s5 = 5;
    localparam s6 = 6;
    
    // State register
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end
    
    // Next state logic
    always @(*)
    begin
        case(state_reg)
            //000 detector
            s0: if(x)
                    state_next = s4;
                else
                    state_next = s1;                
            s1: if(x)
                    state_next = s4;
                else
                    state_next = s2;                 
            s2: if(x)
                    state_next = s4;
                else
                    state_next = s3; 
            s3: if(x)
                    state_next = s4;
                else
                    state_next = s3;
                    
            //111 detector
            s4: if(x)
                    state_next = s5;
                else
                    state_next = s1;                
            s5: if(x)
                    state_next = s6;
                else
                    state_next = s1;                 
            s6: if(x)
                    state_next = s6;
                else
                    state_next = s1;
            default: state_next = state_reg;            
        endcase
    end
    
    // Output logic
    assign y = (state_reg == s3)| (state_reg == s6);
    
endmodule
