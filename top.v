module top(
    input btnU,
    input btnC,
    output [6:0] led
);

wire [2:0] Q;
wire Qnot;

T_flip_flop stageone(
    .T(1'b1),
    .reset(btnU),
    .Q(Q[0]),
    .clock(btnC),
    .Qnot(Qnot)
);

T_flip_flop stagetwo(
    .T(1'b1),
    .reset(btnU),
    .Q(Q[1]),
    .clock(Q[0]),
    .Qnot(Qnot)
);

T_flip_flop stagethree(
    .T(1'b1),
    .reset(btnU),
    .Q(Q[2]),
    .clock(Q[1]),
    .Qnot(Qnot)
);

assign led[0] = Q[0];
assign led[1] = Q[1];
assign led[2] = Q[2];


wire [2:0] Q1;
wire [2:0] sum;
wire [2:0] Co;

full_adder part1
    (
        .A(Q1[0]),
        .B(1'b1),
        .Y(sum[0]),
        .Cin(1'b0),
        .Cout(Co[0])
    );

    full_adder part2
    (
        .A(Q1[1]),
        .B(1'b0),
        .Y(sum[1]),
        .Cin(Co[0]),
        .Cout(Co[1])
    );

    full_adder part3
    (
        .A(Q1[2]),
        .B(1'b0),
        .Y(sum[2]),
        .Cin(Co[1]),
        .Cout(Co[2])
    );

    D_flip_flop A
    (
        .D(sum[0]),
        .Q(Q1[0]),
        .reset(rst),
        .clock(btnC),
        .Qnot()
    );

    D_flip_flop B
    (
        .D(sum[1]),
        .Q(Q1[1]),
        .reset(rst),
        .clock(btnC),
        .Qnot()
    );

    D_flip_flop C
    (
        .D(sum[2]),
        .Q(Q1[2]),
        .reset(rst),
        .clock(btnC),
        .Qnot()
    );
    
wire out;
assign outpt = Q1[0] & ~Q1[1] & Q1[2];
assign led[6] = out;   
assign outlogic = outpt ^ out;
assign rst = outpt | btnU;

D_flip_flop ot 
(
    .D(outlogic),
    .Q(out),
    .reset(btnU),
    .clock(btnC),
    .Qnot()
);
assign led[3] = Q1[0];
assign led[4] = Q1[1];
assign led[5] = Q1[2];
endmodule

    



