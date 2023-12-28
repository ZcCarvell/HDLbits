module top_module (input x, input y, output z);

    wire    ia1_z;
    wire    ia2_z;
    wire    ib1_z;
    wire    ib2_z;

    A IA1(
        .x(x),
        .y(y),
        .z(ia1_z)
    );

    A IA2(
        .x(x),
        .y(y),
        .z(ia2_z)
    );

    B IB1(
        .x(x),
        .y(y),
        .z(ib1_z)
    );

    B IB2(
        .x(x),
        .y(y),
        .z(ib2_z)
    );

    assign z = (ia1_z | ib1_z) ^ (ia2_z & ib2_z);

endmodule

module A (input x, input y, output z);

    assign z = (x^y) & x;

endmodule

module B ( input x, input y, output z );

    assign  z = (!x & !y) | (x & y);

endmodule
