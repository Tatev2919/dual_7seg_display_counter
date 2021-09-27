module dual_7_seg_display ( clk,rst,start, led_out);
	input start;
	input clk,rst;
	output [8:0] led_out;
	
	reg flag;
	reg [7:0] led_out1;
	reg [7:0] led_out2;

	always @(posedge clk or posedge rst) begin 
		if (rst) begin 
			led_out1 <= 8'd0;
			led_out2 <= 8'd0;
		end
		else begin 
			if ( start ) begin 
				flag <= 1;
			end
			if ( flag )  begin 
				led_out1 <= led_out1 + 1;
				if (led_out1 == 8'd9) begin 
					led_out1 <= 8'd0;
					led_out2 <= led_out2 + 1;
					if ( led_out2 == 8'd5) begin 
						led_out2 <= 8'd0;
					end 
				end

			end

		end
	end
        
	assign led_out = led_out2*8'd10 + led_out1;	

endmodule
