module mealy_0100(
  input logic clk,rst,din,
  output logic dout
);

typedef enum logic [1:0]{
  s0 = 2'b00,
  s1 = 2'b01,
  s2 = 2'b10,
  s3 = 2'b11
} state;

state present_state, next_state;
//state register block
always_ff @(posedge clk or posedge rst ) begin 
  if(rst)
    present_state <= s0;
  else
    present_state <= next_state;
end

//combinational block 
always_comb begin
  next_state = present_state;
  
  dout = 0;

  case (present_state)
    s0: 
      if(din)
        next_state = s0;
      else
        next_state = s1;
    s1: 
      if(din)
        next_state = s2;
      else
        next_state = s1;
    s2: 
      if(din)
        next_state = s0;
      else
        next_state = s3;
    s3: 
      if(din)
        next_state = s2;
      else begin
        dout = 1;
        next_state = s1;
      end
  endcase
end

endmodule

