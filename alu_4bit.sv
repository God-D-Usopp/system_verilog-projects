module alu_4bit(
  input logic [3:0] a,b,
  input logic [3:0] s,
  output logic [7:0] out, //mult output is 8 bit for 4bit i/p
  output logic carry,
  output logic zero,
  output logic overflow
);
always @(*) begin
  carry = 0;
  overflow = 0;
  out = 0;
  case(s)
    4'b0000 : {carry ,out[3:0]} = a + b;
    4'b0001 : {carry ,out[3:0]} = a - b;
    4'b0010 : out = a * b;
    4'b0011 : begin 
                if(b != 4'b0000)
                  out[3:0] = a/b;
                else
                 out = 0;
              end
    4'b0100 : out[3:0] = a & b;
    4'b0101 : out[3:0] = a | b;
    4'b0110 : out[3:0] = a ^ b;
    4'b0111 : out[3:0] = ~a;
    4'b1000 : out[3:0] = a << 1;
    4'b1001 : out[3:0] = a >> 1;
    4'b1010 : out[3:0] = {a[2:0], a[3]};
    4'b1011 : out[3:0] = {a[0], a[3:1]};
    4'b1100 : out[0] = (a == b);
    4'b1101 : out[0] = (a>b);
    4'b1110 : {carry, out[3:0]} = a+1;
    4'b1111 : out[3:0] = a-1;
  endcase
  zero = (out == 8'b00000000);
  if(s==4'b0000) 
    overflow = ( ~a[3] & ~b[3] & out[3])|(a[3] & b[3] & ~out[3]);
  
  if(s==4'b0001) 
    overflow = ( ~a[3] & b[3] & out[3])|(a[3] & ~b[3] & ~out[3]);
  
end

endmodule