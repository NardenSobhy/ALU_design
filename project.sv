

module ALU (In1,In2,SEL,out);
	input [7:0] In1;
	input [7:0] In2;	
	input [3:0] SEL;
	output [15:0] out;

	reg signed [15:0] result;
	assign out = result;

	parameter ADD = 4'b0000;
	parameter SUB = 4'b0001;
	parameter MUL = 4'b0010;
	parameter DIV = 4'b0011;
	parameter AND = 4'b0100;
	parameter OR = 4'b0101;
	parameter NOT = 4'b0110;
	parameter XOR = 4'b0111;
	parameter SL = 4'b1000;
	parameter SR = 4'b1001;

	always@(In1 or In2 or SEL)
		case(SEL)
			ADD: result = In1 + In2;
			SUB: result = In1 - In2;
			MUL: result = In1 * In2;
			DIV: result = In1 / In2;
			AND: result = In1 & In2;
			OR: result = In1 | In2;
			NOT: result = {8'h00,~(In1)};
			XOR: result = In1 ^ In2; 
			SL: result = In1 << In2;
			SR: result = In1 >> In2;
			default: result = 16'hxxxx;
		endcase

endmodule


