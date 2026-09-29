module tbalu_4bit;

logic [3:0] a,b;
logic [3:0] s;
logic [7:0] out;
logic carry,zero,overflow;

alu_4bit uut(
  .a(a),
  .b(b),
  .s(s),
  .out(out),
  .carry(carry),
  .zero(zero),
  .overflow(overflow)
);

initial begin
  $dumpfile("alu.vcd");
  $dumpvars(0, tbalu_4bit);
  
  a = 4'b0100 ; b=4'b0011; 
  $display("a =%b\t b=%b",a,b);
  $display("Time\t s \toutput \t\tcarry\tzero\toverflow");
  
  for (int i= 0; i<16; i++) begin
    s = i[3:0]; 
    // $monitor("%0t\t %b \t%b \t%b\t%b",$time,s,out,carry,zero);  
    //always use display inside a loop after a delay
    #10; //like this #10 for out updation
    
    $display("%0t\t %b \t%b \t%b\t%b\t%b",$time,s,out,carry,zero,overflow);  
  end

  #20;

  $finish;
end

endmodule