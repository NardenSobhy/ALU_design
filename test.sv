`timescale 1ns/1ps
`define PER #10

module test();
	reg [7:0] In1;
	reg [7:0] In2;
	reg [3:0] SEL;
	wire [15:0] out;

	byte i,j,k;

	ALU A (In1,In2,SEL,out);

	initial
	begin
		for (i = 0 ; i <= 10 ; i = i + 1 )
		begin
			In1=i;
			for (j = 0 ; j <= 10 ; j = j + 1)
			begin 
				In2=j;
				
				SEL = 4'b0000;
				//`PER;
				for( k=0; k< 15 ; k=k+1)
				begin 	
					`PER
					case(SEL)
						4'b0000:if(out != (i+j))
							$display("Wrong result");
						4'b0001:if(out != (i-j))
							$display("wrong result");
						4'b0010:if(out != (i*j))
							$display("wrong result");
						4'b0011:if(out != (i/j))
							$display("wrong result");
						4'b0100:if(out != (i&j))
							$display ("wrong result");
						4'b0101:if(out != (i|j))
							$display ("wrong result");
						4'b0110:if(out != ({8'h00 , ~(i)}))
							$displaY("wrong result");
						4'b0111:if(out != (i^j))
							$display ("wrong result");
						4'b1000:if(out != (i<<j))
							$display("wrong result");
						4'b1001:if(out != (i>>j))
							$display("wrong result");
						default:if(out != 16'hxxxx)
							$display ("wrong result");
					endcase
					SEL = SEL +1;
				end
					
			end
		end
	end



	initial
		$monitor ($time,,In1,In2,, SEL ,, out);

endmodule
