module D_flip_flop(
input D,
input reset,
input clock,
output reg Q,
output Qnot
);

assign Qnot = ~Q;
initial begin
Q <= 0;
end

always @(posedge clock) begin
if (reset)
Q <= 0;
else
Q <= D;
end

endmodule