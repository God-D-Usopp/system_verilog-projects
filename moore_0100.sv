module moore_0100(
  input logic clk,rst,din,
  output logic dout
);

typedef enum logic [2:0]{
  s0 = 3'b000,
  s1 = 3'b001,
  s2 = 3'b010,
  s3 = 3'b011,
  s4 = 3'b100
}state;

state present_state, next_state;

always_ff @( posedge clk or posedge rst) begin
  if(rst)
    present_state <= s0;
  else
    present_state <= next_state;  
end

always_comb begin 
  next_state = present_state;
  dout =0;

  case(present_state)
    s0 : 
      if(din)
        next_state = s0;
      else
        next_state = s1;
    s1 : 
      if(din)
        next_state = s2;
      else
        next_state = s1;
    s2 : 
      if(din)
        next_state = s0;
      else
        next_state = s3;
    s3 : 
      if(din)
        next_state = s2;
      else
        next_state = s4;
    s4 :  // moore logic so whenever enters to s4 output sequence 
      if(din) begin //detected so both case dout = 1;
        dout =1;
        next_state = s2;
      end
      else begin
        dout =1;
        next_state = s1;
      end   
  endcase  

// always_comb begin
//   case(present_state)

//   endcase
// end
end
endmodule