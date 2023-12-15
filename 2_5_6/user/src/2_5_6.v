module top_module(
        input [ 99: 0 ] a, b,
        input cin,
        output [ 99: 0 ] cout,
        output [ 99: 0 ] sum );


    genvar i;
    generate
        for ( i = 0; i < 100; i = i + 1 ) begin:add100
            if ( i == 0 ) begin
                add2 add2_inst(
                         .a ( a[ i ] ),
                         .b ( b[ i ] ),
                         .cin( cin ),
                         .sum( sum[ i ] ),
                         .cout( cout[ i ] )
                     );
            end
            else begin
                add2 add2_inst(
                         .a ( a[ i ] ),
                         .b ( b[ i ] ),
                         .cin( cout[ i - 1'b1 ] ),
                         .sum( sum[ i ] ),
                         .cout( cout[ i ] )
                     );
            end
        end
    endgenerate


endmodule

module add2(

        input a,
        input b,
        input cin,

        output sum,
        output cout

    );

    assign { cout, sum } = a + b + cin;



endmodule
