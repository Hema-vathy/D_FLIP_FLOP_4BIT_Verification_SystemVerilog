///////////////**************TESTBENCH TOP FILE**************///////////////
`include "clk_gen.sv"
`include "rst_gen.sv"
`include "stimulus_gen.sv"
`include "rst_test.sv"
`include "comparison_test.sv"

int randomdelay;

//module block
module dff_tb_top();
  logic clk;
  logic rst;
  logic[3:0] din;
  logic[3:0] dout;
  logic qin[$];
  logic qout[$];
  
  initial begin
    std::randomize(randomdelay)with{
      randomdelay < 50;
      randomdelay > 20;
    };
  end
  //instantiation block
  dff dff_inst(.*);
  
  //initialization block
  initial begin
    clk=$urandom_range(0,1);
    rst=1'b1;
    din=4'hA2;
  end
  //creating handle
  clk_gen clk_h=new();
  rst_gen rst_h=new();
  stimulus_gen stimulus_h=new();
  rst_test rsttest_h=new();
  comparison comp_h=new();
  
  //display statements
  initial begin
    $display("values of display: clk=%0b time=%0t rst=%0b din=%0h dout=%0h",clk,$time,rst,din,dout);
    $monitor("values of monitor: clk=%0b time=%0t rst=%0b din=%0h dout=%0h",clk,$time,rst,din,dout);
    
  end
  
  //calling classes
  task run();
    fork 
      clk_h.clk_generate(clk);
      rst_h.rst_generate(rst,clk);
      stimulus_h.stimulus_generate(clk,din);
      rsttest_h.reset_test(rst);
      comp_h.compare(din,dout,clk,rst);
    join
  endtask
  
  //calling task
  initial begin
    run();
  end
  
  //waveform creation
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
