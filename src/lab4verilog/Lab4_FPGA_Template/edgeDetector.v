
module edgeDetector(CLK, SI, edgeDetected);

input CLK;
input [2:0] SI;
output edgeDetected;
integer i;

reg [2:0] shift [6:0];

always @(posedge CLK) begin
shift[6] <= SI;

for(i = 0; i < 6; i = i+1)
	shift[i] <= shift [i+1];
end

assign SUM = shift[0]+shift[1]+shift[2]+shift[3]+shift[4]+shift[5]+shift[6];
assign edgeDetected = ((SUM > 7'd3) & ~(shift[6] > 3'b0));

endmodule

