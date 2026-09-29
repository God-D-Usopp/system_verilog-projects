module tbmoore_0100;
logic clk,rst,din,dout;

moore_0100 uut(
  .clk(clk),
  .rst(rst),
  .din(din),
  .dout(dout)
);

initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin
  $dumpfile("moore.vcd");
  $dumpvars(0, tbmoore_0100);

  $display("Time\trst\tclk\tinput\toutput");
  $monitor("%0t\t%b\t%b\t%b\t%b",$time,rst,clk,din,dout);

  rst = 1; din =0;
  @(posedge clk);
  @(posedge clk);

  rst = 0;
  @(posedge clk) din = 0;
  @(posedge clk) din = 0;
  @(posedge clk) din = 1;
  @(posedge clk) din = 0;
  @(posedge clk) din = 0;
  @(posedge clk) din = 0;
  @(posedge clk) din = 1;
  @(posedge clk) din = 0;
  @(posedge clk) din = 0;
  @(posedge clk) din = 1;
  @(posedge clk) din = 0;
  @(posedge clk) din = 0;
  @(posedge clk);@(posedge clk);@(posedge clk);@(posedge clk);
  $finish;
end

endmodule