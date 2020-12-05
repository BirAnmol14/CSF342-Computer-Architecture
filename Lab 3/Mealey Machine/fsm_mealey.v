module mealy_pattern(in,clk,reset,out);
	input in,clk,reset;
	output reg out;
	reg [0:2] state;
	always@(posedge clk,posedge reset)
	begin
		if(reset)
		begin
			state<=3'b000;
			out<=1'b0;
		end
		else
		begin
			case(state)
			3'b000:begin
				if(in)begin
				state<=3'b001;
				out<=1'b0;
				end
				else begin
				state<=3'b000;
				out<=1'b0;
				end
			end
			3'b001:begin
				if(in)begin
				state<=3'b001;
				out<=1'b0;
				end
				else begin
				state<=3'b010;
				out<=1'b0;
				end
			end
			3'b010:begin
				if(in)begin
				state<=3'b011;
				out<=1'b0;
				end
				else begin
				state<=3'b000;
				out<=1'b0;
				end
			end
			3'b011:begin
				if(in)begin
				state<=3'b100;
				out<=1'b0;
				end
				else begin
				state<=3'b010;
				out<=1'b0;
				end
			end
			3'b100:begin
				if(in)begin
				state<=3'b001;
				out<=1'b0;
				end
				else begin
				state<=3'b010;
				out<=1'b1;
				end
			end
			default:
			begin
				state<=3'b000;
				out<=1'b0;
			end
			endcase
		end
	end
endmodule