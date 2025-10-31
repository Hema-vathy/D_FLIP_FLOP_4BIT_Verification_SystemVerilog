//reset generation
class rst_gen;
  task rst_generate(ref logic rst,clk);
    @ (posedge clk or negedge clk) begin
    #randomdelay rst=1'b0;
    end
  endtask
endclass
