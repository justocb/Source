/////////////////////////////////////////////////////
// Counter_tb.v
// 

`timescale 1ps/1ps

module Counter_tb();

reg  rReset;
reg  rClk;
reg  rClear;
reg  rLoad;
reg  rEnable;
reg  [7:0] rCounter;

Counter #(.WORDSIZE(8)) 
U1(
	.iReset(rReset),
	.iClk(rClk),

	.iLoad(rLoad),
	.iEnable(rEnable),
	.iCounter(rCounter),
	.oCounter(),
	
	.oReady()
);

always #(5000) rClk = ~rClk; 

initial
begin
	rReset  <= 1'b0;
	rClk    <= 1'b0;
	rLoad   <= 1'b0;
	rEnable <= 1'b0;
	#5000
	
	// Reset
	rReset <= 1'b1;
	#2000
	rReset <= 1'b0;
	#18000
	
	// Load Counter
	rLoad <= 1'b1;
	#10000
	rLoad <= 1'b0;
	#18000
	
	// Enable Counter
	rEnable <= 1'b1;
	#100000000;
end

endmodule
