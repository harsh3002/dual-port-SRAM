
`timescale 1ns/1ns

module dual_sram_tb 
#(parameter WIDTH=8,
  parameter DEPTH=8,
  parameter ADDR_WIDTH=$clog2(DEPTH)) ;

wire [WIDTH-1:0] data_out_a_tb,data_out_b_tb;
reg [WIDTH-1:0] data_in_a_tb,data_in_b_tb;
reg clk_tb;
reg reset_tb;
reg chip_sel_tb;
reg read_ena_a_tb,read_ena_b_tb;
reg [ADDR_WIDTH-1:0] address_a_tb,address_b_tb;

dual_sram dut(
.data_out_a(data_out_a_tb),
.data_out_b(data_out_b_tb),
.data_in_a(data_in_a_tb),
.data_in_b(data_in_b_tb),
.clk(clk_tb),
.reset(reset_tb),
.chip_sel(chip_sel_tb),
.read_ena_a(read_ena_a_tb),
.read_ena_b(read_ena_b_tb),
.address_a(address_a_tb),
.address_b(address_b_tb));

initial begin
	clk_tb=1'b0;
	forever #5 clk_tb=~clk_tb;
end

initial begin
	chip_sel_tb<=0;
	#5 chip_sel_tb<=1;
end

initial begin
#5 read_ena_a_tb<=0;  data_in_a_tb<=0; address_a_tb<=0;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b10101010; address_a_tb<=3'b100;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b100;
#10 read_ena_a_tb<=1; data_in_a_tb<=8'b00100101; address_a_tb<=3'b110;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b00100101; address_a_tb<=3'b110;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b110;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b11111111; address_a_tb<=3'b001;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b001;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b010;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b11011010; address_a_tb<=3'b010;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b010;

#10 read_ena_b_tb<=0; data_in_b_tb<=8'b10101010; address_b_tb<=3'b000;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b000;
#10 read_ena_b_tb<=1; data_in_b_tb<=8'b00100101; address_b_tb<=3'b111;
#10 read_ena_b_tb<=0; data_in_b_tb<=8'b00100101; address_b_tb<=3'b111;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b111;
#10 read_ena_b_tb<=0; data_in_b_tb<=8'b11111111; address_b_tb<=3'b011;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b011;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b101;
#10 read_ena_b_tb<=0; data_in_b_tb<=8'b11011010; address_b_tb<=3'b101;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b101;

#100 reset_tb<=1;
#10 reset_tb<=0;

#10 read_ena_a_tb<=0; data_in_a_tb<=8'b10101010; address_a_tb<=3'b100;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b100;
#10 read_ena_a_tb<=1; data_in_a_tb<=8'b00100101; address_a_tb<=3'b110;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b00100101; address_a_tb<=3'b110;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b110;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b11111111; address_a_tb<=3'b001;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b001;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b010;
#10 read_ena_a_tb<=0; data_in_a_tb<=8'b11011010; address_a_tb<=3'b010;
#10 read_ena_a_tb<=1; data_in_a_tb<=0; address_a_tb<=3'b010;

#10 read_ena_b_tb<=0; data_in_b_tb<=8'b10101010; address_b_tb<=3'b000;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b000;
#10 read_ena_b_tb<=1; data_in_b_tb<=8'b00100101; address_b_tb<=3'b111;
#10 read_ena_b_tb<=0; data_in_b_tb<=8'b00100101; address_b_tb<=3'b111;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b111;
#10 read_ena_b_tb<=0; data_in_b_tb<=8'b11111111; address_b_tb<=3'b011;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b011;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b101;
#10 read_ena_b_tb<=0; data_in_b_tb<=8'b11011010; address_b_tb<=3'b101;
#10 read_ena_b_tb<=1; data_in_b_tb<=0; address_b_tb<=3'b101;

end

endmodule
