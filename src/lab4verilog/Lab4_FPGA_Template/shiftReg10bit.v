
module shiftReg11bit (CLK, SI, SO, SUM, edgeDetected);

input CLK;
input [2:0] SI;
output [2:0] SO;
output [6:0] SUM;
output edgeDetected;
integer i;

reg [2:0] SO;

reg [2:0] shift [10:0];

always @(posedge CLK) begin
shift[10] <= SI;
SO <= shift[0];

for(i = 0; i < 10; i = i+1)
	shift[i] <= shift [i+1];
end

assign SUM = shift[0]+shift[1]+shift[2]+shift[3]+shift[4]+shift[5]+shift[6]+shift[7]+shift[8]+shift[9]+shift[10];
assign edgeDetected = ((SUM > 7'd3) & ~(shift[5] > 3'b0));

endmodule

