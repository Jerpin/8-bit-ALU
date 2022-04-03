module ALU_1bit(result, c_out, set, overflow, a, b, less, Ainvert, Binvert, c_in, op);
input        a;
input        b;
input        less;
input        Ainvert;
input        Binvert;
input        c_in;
input  [1:0] op;
output       result;
output       c_out;
output       set;                 
output       overflow;      
reg result;


wire a_, b_, sum;
FA FA(.x(a_), .y(b_), .carry_in(c_in), .s(sum), .carry_out(c_out));
assign a_ = (Ainvert == 1'b0)?  a : ~a;
assign b_ = (Binvert == 1'b0)?  b : ~b;
assign overflow = c_in ^ c_out;
assign set = sum;

      always@(a or b or op or result or sum or less)
          begin
               case ({Ainvert,Binvert,op})
                  4'b0010:  result <= sum;   // add
                  4'b0110:  result <= sum;   
                  4'b0000:  result <= a & b;    
                  4'b0001:  result <= a | b;   
                  4'b1101:  result <= ~(a & b);
                  4'b1100:  result <= ~(a|b);
                  //4'b0111:  result <= (a<b)?1:0;
                  default:  result <= less;

               endcase
           end
endmodule
