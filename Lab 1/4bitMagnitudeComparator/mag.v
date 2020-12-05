module magnitudeComp4bit(opg,ope,opl,a,b);
	input [3:0] a,b;
	output opg,ope,opl;
	reg opg,ope,opl;
	always @ (a or b)
	begin
		 if(a > b)   begin  
            opl = 0;
            ope = 0;
            opg = 1;    end
        else if(a == b) begin 
            opl = 0;
            ope = 1;
            opg = 0;    end
        else    begin 
            opl = 1;
            ope = 0;
            opg =0;
        end 
	end
endmodule