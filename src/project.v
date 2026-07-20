module n_bit_alu #(parameter  n = 19 ) (
    input wire [n-1 : 0] a,
    input wire [n-1 : 0] b,
    input wire [2:0] alu_control, //0,1,2 are 3 bits so we can have 2³ operations ie 8
    output reg [n-1 : 0] result,
    output wire zero //flag output for checking zero/2 numbers being equal
);

always @(*) begin
    case (alu_control)
    3'b000: result = a + b;  //if input wire is 000 it adds
    3'b001: result = a - b;  //if input wire is 000 it subtracts
    3'b010: result = a & b;  //if input wire is 000 it performs bitwise of AND gate
    3'b011: result = a | b;  //if input wire is 000 it performs bitwise of OR gate
    3'b100: result = a ^ b;  //if input wire is 000 it performs bitwise of XOR gate
    3'b101: result = a << 1; //if input wire is 101 it shifts input a to the left by 1 position (multiplying by 2)
    3'b110: result = a >> 1; //if input wire is 110 it shifts input a to the right by 1 position (divides by 2)
    default: result = 0; //sets result to 0 in case of unexpected code
    endcase
end

assign zero = (result == 0) ? 1'b1 : 1'b0; //it checks if both are equal or not

endmodule


/*this one is simple except the 101 and 110 so how it works is 
ex number is 14 so in 5 bits it will be 01110 ie 8+4+2 if we move them left by 1 it will be 11100 16+8+4 = 28 twice of 14
same goes for dividing*/
