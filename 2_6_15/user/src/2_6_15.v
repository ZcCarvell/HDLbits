module top_module( 
    input [2:0] in,
    output [1:0] out );

    reg [1:0]   out_reg;

    always @(*)begin
        out_reg = 1'b0;
        for(int i = 0; i < 3; i = i + 1)
            if(in[i])
                out_reg = out_reg + 1;
    end

    assign  out = out_reg;

endmodule
