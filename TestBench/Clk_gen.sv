//clock generation
class clk_gen;
  task clk_generate(ref logic clk);
    forever #5 clk=~clk;
  endtask
endclass
