module top_module (input x, input y, output z);

    A A_inst(
          .x 	( x  ),
          .y 	( y  ),
          .z 	( z  )
      );


endmodule


module A (input x, input y, output z);

    assign z = (x^y) & x;

endmodule
