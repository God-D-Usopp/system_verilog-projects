module tbdig_clk;
logic rst, clk;
logic [5:0] sec, min, hour;

dig_clk uut(
  .clk(clk), .rst(rst),
  .sec(sec), .min(min), .hour(hour)
);
initial begin
  $dumpfile("dig_clk.vcd");
  $dumpvars(0, tbdig_clk);
  
  $display("HH MIN SEC ");
  $monitor("%d : %d : %d  ", hour,min,sec);
  clk =0;rst = 1;
  #4;
  rst = 0;
  #320000;
  $finish;
end
always #2 clk = ~clk;
endmodule