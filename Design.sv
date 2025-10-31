//////////////////////**********D FLIP FLOP DESIGN CODE**********//////////////////////
module dff(input clk,input rst,input [3:0] din,output reg[3:0] dout, input qin[$],input qout[$]);
 always @(posedge clk or negedge clk) begin
  //always @(posedge clk ) begin
    if(!rst) begin
        dout =din;
    end
    else begin
        dout =0;
    end
 end
endmodule
