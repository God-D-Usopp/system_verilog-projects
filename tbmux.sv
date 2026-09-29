module tbmux;
logic [3:0]a,b,c,d;
logic s0,s1;
logic [3:0]out;

mux uut(
  .a(a),
  .b(b),
  .c(c),
  .d(d),
  .s0(s0),
  .s1(s1),
  .out(out)
);

initial begin
  $dumpfile("mux.vcd");
  $dumpvars(0 ,tbmux);
  a = 4'b0011;b=4'b1100; c=4'b1101; d=4'b1010;
  $display("a =%b b=%b c=%b d=%b",a,b,c,d);
  $display("Time\ts0\ts1\tout");
  $monitor("%0t\t%b\t%b\t%b", $time,s1,s0,out);
  
  s0 = 0; s1=0;
  #10;
  s0 = 1; s1=0;
  #10;
  s0 = 0; s1=1;
  #10;
  s0 = 1; s1=1;
  #10;
  $finish;

end

endmodule