`include "alu.v"
module alu_tb;
    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] opcode;
    wire [4:0] result;
    wire       carry;
    wire       zero;

    alu_4bit DUT ( .A(A), .B(B), .opcode(opcode), .result(result), .carry(carry), .zero(zero));
   
    integer i;
    initial begin
        $display("=== Random ALU Test ===");
        for(i = 0; i < 20; i = i + 1) begin
           {A,B,opcode}=$random;
            #10;
            $display("A=%b B=%b opcode=%b result=%b carry=%b zero=%b",A, B, opcode, result, carry, zero);
        end
        $finish;
    end
endmodule
