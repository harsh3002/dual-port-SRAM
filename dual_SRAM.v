
`timescale 1ns/1ns

module dual_sram
#(parameter WIDTH=8,
  parameter DEPTH=8,
  parameter ADDR_WIDTH=$clog2(DEPTH))(
output reg [WIDTH-1:0] data_out_a,data_out_b,
input [WIDTH-1:0] data_in_a,data_in_b,
input clk,
input reset,
input chip_sel,
input read_ena_a,read_ena_b,
input [ADDR_WIDTH-1:0] address_a,address_b);


reg [WIDTH-1:0] mem [0:DEPTH-1];

//Operations of port A
always@(posedge clk) begin
	if(reset) begin
		mem[0][7:0]<=0;
		mem[1][7:0]<=0;
		mem[2][7:0]<=0;
		mem[3][7:0]<=0;
		mem[4][7:0]<=0;
		mem[5][7:0]<=0;
		mem[6][7:0]<=0;
		mem[7][7:0]<=0;
	end
	else begin
		if( chip_sel  &  read_ena_a )   //Read Operation
			data_out_a<=mem[address_a];
		else if( chip_sel  &  !read_ena_a )   	//Write Operation
			mem[address_a]<=data_in_a;
		else data_out_a<=0;
	end
	
end

//Operations of port B
always@(posedge clk) begin
	if(reset) begin
		mem[0][7:0]<=0;
		mem[1][7:0]<=0;
		mem[2][7:0]<=0;
		mem[3][7:0]<=0;
		mem[4][7:0]<=0;
		mem[5][7:0]<=0;
		mem[6][7:0]<=0;
		mem[7][7:0]<=0;
	end
	else begin
		if( chip_sel  &  read_ena_b )   //Read Operation
			data_out_b<=mem[address_b];
		else if( chip_sel  &  !read_ena_b )   	//Write Operation
			mem[address_b]<=data_in_b;
		else data_out_b<=0;
	end
	
end

endmodule

