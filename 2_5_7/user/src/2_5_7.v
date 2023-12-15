module top_module(
        input [ 399: 0 ] a, b,
        input cin,
        output cout,
        output [ 399: 0 ] sum );

    wire [ 399: 0 ] cout_temp;
    assign cout = cout_temp[ 396 ];

    genvar i;
    generate
        for ( i = 0; i < 400; i = i + 4 ) begin:Bcdadd100
            if ( i == 0 ) begin
                bcd_fadd bcd_fadd_inst(
                             .a ( a[ i + 3: i ] ),
                             .b ( b[ i + 3: i ] ),
                             .cin( cin ),
                             .sum( sum[ i + 3: i ] ),
                             .cout ( cout_temp[ i ] )
                         );
            end
            else begin
                bcd_fadd bcd_fadd_inst(
                             .a ( a[ i + 3: i ] ),
                             .b ( b[ i + 3: i ] ),
                             .cin( cout_temp[ i - 4 ] ),
                             .sum( sum[ i + 3: i ] ),
                             .cout ( cout_temp[ i ] )
                         );
            end

        end
    endgenerate




endmodule
