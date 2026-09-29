module dig_clk(
  input logic rst,clk,
  output logic [5:0] sec,min,hour
);
always_ff @(posedge clk or posedge rst) begin
  
  if(rst | (hour == 23 & min == 59 & sec ==59)) begin
    sec<=0; min<=0; hour<=0;
  end

  else begin
    if(sec==59) begin
      sec <= 0;
      if(min == 59) begin
        min <= 0;
        if(hour == 23) 
          hour <= 0;       
        else 
          hour <= hour+1 ;  
      end
      else
        min <= min+1;
    end
    else
      sec <=sec+1;
  end 

end
endmodule