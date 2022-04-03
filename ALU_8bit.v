module ALU_8bit(result, zero, overflow, ALU_src1, ALU_src2, Ainvert, Binvert, op);
input  [7:0] ALU_src1;
input  [7:0] ALU_src2;
input        Ainvert;
input        Binvert;
input  [1:0] op;
output [7:0] result;
output       zero;
output       overflow;

wire [7:0] c_out;
wire [7:0] set;
wire [7:0] overf;
assign comb = set[7] + overf[7];
assign overflow = overf[7];

ALU_1bit ALU_1bit_0(.result(result[0]), .c_out(c_out[0]), .set(set[0]), .overflow(overf[0]), .a(ALU_src1[0]), .b(ALU_src2[0]), .less(comb), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(Binvert), .op(op));
ALU_1bit ALU_1bit_1(.result(result[1]), .c_out(c_out[1]), .set(set[1]), .overflow(overf[1]), .a(ALU_src1[1]), .b(ALU_src2[1]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[0]), .op(op));
ALU_1bit ALU_1bit_2(.result(result[2]), .c_out(c_out[2]), .set(set[2]), .overflow(overf[2]), .a(ALU_src1[2]), .b(ALU_src2[2]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[1]), .op(op));
ALU_1bit ALU_1bit_3(.result(result[3]), .c_out(c_out[3]), .set(set[3]), .overflow(overf[3]), .a(ALU_src1[3]), .b(ALU_src2[3]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[2]), .op(op));
ALU_1bit ALU_1bit_4(.result(result[4]), .c_out(c_out[4]), .set(set[4]), .overflow(overf[4]), .a(ALU_src1[4]), .b(ALU_src2[4]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[3]), .op(op));
ALU_1bit ALU_1bit_5(.result(result[5]), .c_out(c_out[5]), .set(set[5]), .overflow(overf[5]), .a(ALU_src1[5]), .b(ALU_src2[5]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[4]), .op(op));
ALU_1bit ALU_1bit_6(.result(result[6]), .c_out(c_out[6]), .set(set[6]), .overflow(overf[6]), .a(ALU_src1[6]), .b(ALU_src2[6]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[5]), .op(op));
ALU_1bit ALU_1bit_7(.result(result[7]), .c_out(c_out[7]), .set(set[7]), .overflow(overf[7]), .a(ALU_src1[7]), .b(ALU_src2[7]), .less(1'b0), .Ainvert(Ainvert), .Binvert(Binvert), .c_in(c_out[6]), .op(op));

assign zero = ~(result[0] | result[1] | result[2] | result[3] | result[4] | result[5] | result[6] | result[7]);

endmodule
