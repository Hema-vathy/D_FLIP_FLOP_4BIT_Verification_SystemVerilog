//stimulus block
class stimulus_gen;
  task stimulus_generate(ref logic clk,logic[3:0] din);
    repeat (randomdelay) /*@(posedge clk)*/ begin
    //@(posedge clk or negedge clk) begin 
      //repeat (randomdelay)
      //@(posedge clk ) din=$urandom_range(4'h0,4'hF);
     #5 din=$urandom_range(4'h0,4'hF);
    // qin1=qin.push_back(din);
    end
    //end
    $finish;
  endtask
endclass
