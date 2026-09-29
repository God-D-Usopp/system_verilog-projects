module mux(
  input logic [3:0] a,b,c,d,
  input logic s0,s1,
  output logic [3:0] out
);
always_comb begin
  case({s1,s0})
    2'b00 : out = a;
    2'b01 : out = b;
    2'b10 : out = c;
    2'b11 : out = d;
  endcase
end
endmodule 