module tb();

reg clk,rst,c;
wire HL_GREEN,HL_YELLOW,HL_RED,FL_GREEN,FL_YELLOW,FL_RED;

q4 dut(clk,rst,c,HL_GREEN,HL_YELLOW,HL_RED,FL_GREEN,FL_YELLOW,FL_RED);

initial begin
	$dumpfile("q4.vcd");
	$dumpvars();
end

always #2 clk=~clk;


initial begin
	
	$monitor($time,"clk=%b,present_state=%b,C=%b,HL_GREEN=%b,HL_YELLOW=%b,HL_RED=%b,FL_GREEN=%b,FL_YELLOW=%b,FL_RED=%b",clk,dut.present_state,c,HL_GREEN,HL_YELLOW,HL_RED,FL_GREEN,FL_YELLOW,FL_RED);
	
	clk=0;rst=0;c=0;
	#1 rst=1;
	@(negedge clk) c=0;
	@(negedge clk) c=1;
	@(negedge clk) c=1;	
	@(negedge clk) c=0;
	#150;
	@(negedge clk) c=1;	
	@(negedge clk) c=0;
	#100$finish;
end
endmodule
