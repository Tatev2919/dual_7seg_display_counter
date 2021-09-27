`timescale 1 ns/ 1 ps
module dual_7_seg_display_tb;
	reg clk,start,rst;
	wire led_out;

	initial begin
		$dumpfile("v.vcd");
		$dumpvars();
	end

	initial begin 
		clk = 0;
		rst = 1;
		start = 0;
		#10;
		rst = 0;
		@(negedge clk) start <= 1;
		#50000;
		$finish;
	end

	always #10 clk = ~clk;

endmodule
