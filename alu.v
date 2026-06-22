
module alu_4bit (
    input  [3:0] A,        
    input  [3:0] B,        
    input  [2:0] opcode,   
    output reg [4:0] result,
    output reg       carry, 
    output reg       zero);

always @(*) begin
    carry  = 1'b0;
    zero   = 1'b0;
    result = 5'b0;
    case (opcode)
        3'b000: result = A + B;           // ADD
        3'b001: result = A - B;           // SUBTRACT
        3'b010: result = A & B;           // AND
        3'b011: result = A | B;           // OR
        3'b100: result = A ^ B;           // XOR
        3'b101: result = ~A;              // NOT A
        3'b110: result = A << 1;          // LEFT SHIFT A by 1
        3'b111: result = A >> 1;          // RIGHT SHIFT A by 1
        default: result = 5'b0;
    endcase
    carry = result[4];           
    zero  = (result == 5'b0);   
end
endmodule
