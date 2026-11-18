module T_flip_flop(
    input T,
    input reset,
    input clock,
    output reg Q, 
    output Qnot
);

wire D;
assign D = (~T & Q) | (T & ~Q);
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