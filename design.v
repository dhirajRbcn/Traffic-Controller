module design(clk,rst,c,HL_GREEN,HL_YELLOW,HL_RED,FL_GREEN,FL_YELLOW,FL_RED);
input clk,rst,c;
output  HL_GREEN,HL_YELLOW,HL_RED,FL_GREEN,FL_YELLOW,FL_RED;

localparam A=4'h0,B=4'h1,C=4'h2,D=4'h3,E=4'h4,F=4'h5;
reg[3:0] present_state,next_state;
reg ST=0;
reg [3:0]TL=0,TS=0;
always@(*) begin
	case(present_state)
		A : begin 
		next_state = c ? B : A;
		ST=0;
		TS=0;
		TL=0;
	end
	B : begin
		ST=1;
		TS=0;
		next_state = TL==6 ? C : B;
	end
	C : begin
		TL=0;
		next_state = TS==2 ? D : C;
	end
	D : begin
		TS=0;
		next_state = TL==6 ? E : D;
	end

	E : begin
		next_state = TS==2 ? A : E;
	end
	default : next_state=A;
endcase
end

always @(posedge clk or negedge rst) begin
	if(ST!=0) begin
		TL=TL+1;
		if(TL==7)
			TL=0;
		TS=TS+1;
		if(TS==3)
			TS=0;
	end
	if(!rst) present_state<=A;
	else present_state<=next_state;
end
assign HL_GREEN=(present_state==A) || (present_state==B);
assign FL_RED=(present_state==A) || (present_state==B) || (present_state==C);
assign HL_YELLOW=(present_state==C);
assign HL_RED=(present_state==D) || (present_state==E) ;
assign FL_GREEN=(present_state==D);
assign FL_YELLOW=(present_state==E);

endmodule
