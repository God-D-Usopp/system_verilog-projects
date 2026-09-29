module tbmealy_0100;

logic clk,rst,din;
logic dout;

mealy_0100 uut(
  .clk(clk),
  .rst(rst),
  .din(din),
  .dout(dout)
);
initial begin
  clk =0;
  forever #5 clk = ~clk;
end
initial begin
  $dumpfile("mealy_0100.vcd");
  $dumpvars(0, tbmealy_0100);

  $display("Time\trst\tclk\tdin\toutput");
  $monitor ("%0t\t%b\t%b\t%b\t%b",$time,rst,clk,din,dout);
  rst= 1;din = 0;
  // forholding cycle for 1 clk 
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
  $finish;
end
// always #5 clk = ~clk;
endmodule