//////////////****************COMPARISON TEST BLOCK****************//////////////
class comparison;
  task compare(ref logic[3:0] din,ref logic[3:0] dout,ref logic clk,ref logic rst);
    forever @(posedge clk or negedge clk)begin
      #1 if(!rst) begin
        //@(posedge clk) begin 
          if(din == dout)begin
            $display("din matches with dout so test is passed din=%0h dout=%0h time=%0t",din,dout,$time);
        end
        else begin
          $error("din not matches with dout so test is failed din=%0h dout=%0h time=%0t",din,dout,$time);
        end
        //end
      end
      else begin
        if(dout == 0)begin
          $display("din=%0h dout=%0h time=%0t so test is passed",din,dout,$time);
        end
        else begin
          $error("din=%0h dout=%0h time=%0t dout is not 0 so test is failed",din,dout,$time);
        end
      end
    end
  endtask 
endclass
