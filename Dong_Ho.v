module BCD_counter(ck,rs,bcd1,bcd2,bcd3,bcd4,bcd5,bcd6,trangthai,baothuc,led);
input ck,rs;
input [0:0]trangthai;
input [15:0]baothuc;
output [3:0]bcd1,bcd2,bcd3,bcd4,bcd5,bcd6;
output reg [0:0]led;
reg [3:0]bcd1,bcd2,bcd3,bcd4,bcd5,bcd6;

integer count = 0;
integer flag = 0;
always @(posedge ck)
begin 
	if (rs == 1'b1)
	begin
		bcd1 <= 4'b0000; //gio chuc 
		bcd2 <= 4'b0000; //gio don vi
		bcd3 <= 4'b0000; //phut chuc 
		bcd4 <= 4'b0000; //phut don vi
		bcd5 <= 4'b0000; //giay chuc 
		bcd6 <= 4'b0000; //giay don vi
	end 
	else 
	begin
		if (trangthai[0] == 1'b0)
		begin
			led[0] <= 1'b0;
			bcd6 <= bcd6 + 1'b1;
			if (bcd6 == 4'b1001)
			begin 
				bcd6 <= 4'b0000;
				bcd5 <= bcd5 + 1'b1;
				if (bcd5 == 4'b0101 && bcd6 == 4'b1001)
				begin 
					bcd5 <= 4'b0000;
					bcd6 <= 4'b0000;
					bcd4 <= bcd4 + 1'b1;
					if (bcd4 == 4'b1001)
					begin 
						bcd4 <= 4'b0000;
						bcd3 <= bcd3 + 1'b1;
						if (bcd3 == 4'b0101 && bcd4 == 4'b1001 && bcd5 == 4'b0101 && bcd6 == 4'b1001)
						begin
							bcd3 <= 4'b0000;
							bcd4 <= 4'b0000;
							bcd5 <= 4'b0000;
							bcd6 <= 4'b0000;
							bcd2 <= bcd2 + 1'b1;
							if (bcd2 == 1'b1001)
							begin
								bcd2 <= 4'b0000;
								bcd1 <= bcd1 + 1'b1;
								if (bcd1 == 4'b0010 && bcd2 == 4'b0011 && bcd3 == 4'b0101 && bcd4 == 4'b1001 && bcd5 == 4'b0101 && bcd6 == 4'b1001)
								begin 
									bcd1 <= 4'b0000;
									bcd2 <= 4'b0000;
									bcd3 <= 4'b0000;
									bcd4 <= 4'b0000;
									bcd5 <= 4'b0000;
									bcd6 <= 4'b0000;
								end 
							end 
						end 
					end 
				end 
			end
		end
		else if (trangthai[0] == 1'b1)
		begin
			if (bcd1 == baothuc[15:12] && bcd2 == baothuc[11:8] && bcd3 == baothuc[7:4] && bcd4 == baothuc[3:0])
			begin
				led[0] <= 1'b1;
				if (bcd6 == 4'b0101)
					led[0] <= 1'b0;
			end
			bcd6 <= bcd6 + 1'b1;
			if (bcd6 == 4'b1001)
			begin 
				bcd6 <= 4'b0000;
				bcd5 <= bcd5 + 1'b1;
				if (bcd5 == 4'b0101 && bcd6 == 4'b1001)
				begin 
					bcd5 <= 4'b0000;
					bcd6 <= 4'b0000;
					bcd4 <= bcd4 + 1'b1;
					if (bcd4 == baothuc[3:0])
						led[0] <= 1'b1;
					if (bcd4 == 4'b1001)
					begin 
						bcd4 <= 4'b0000;
						bcd3 <= bcd3 + 1'b1;
						if (bcd3 == 4'b0101 && bcd4 == 4'b1001 && bcd5 == 4'b0101 && bcd6 == 4'b1001)
						begin
							bcd3 <= 4'b0000;
							bcd4 <= 4'b0000;
							bcd5 <= 4'b0000;
							bcd6 <= 4'b0000;
							bcd2 <= bcd2 + 1'b1;
							if (bcd2 == 1'b1001)
							begin
								bcd2 <= 4'b0000;
								bcd1 <= bcd1 + 1'b1;
								if (bcd1 == 4'b0010 && bcd2 == 4'b0011 && bcd3 == 4'b0101 && bcd4 == 4'b1001 && bcd5 == 4'b0101 && bcd6 == 4'b1001)
								begin 
									bcd1 <= 4'b0000;
									bcd2 <= 4'b0000;
									bcd3 <= 4'b0000;
									bcd4 <= 4'b0000;
									bcd5 <= 4'b0000;
									bcd6 <= 4'b0000;
								end 
							end 
						end 
					end 
				end 
			end
		end
	end
end 
endmodule

module giaimaled7seg(Data,Display0);
input [3:0]Data;
output [6:0]Display0;
reg [6:0]Display0;
always @(Data)
begin 
		case(Data)
		4'b0000: Display0 = 7'b1000000; //0
		4'b0001: Display0 = 7'b1111001; //1
		4'b0010: Display0 = 7'b0100100; //2
		4'b0011: Display0 = 7'b0110000; //3
		4'b0100: Display0 = 7'b0011001; //4
		4'b0101: Display0 = 7'b0010010; //5
		4'b0110: Display0 = 7'b0000010; //6
		4'b0111: Display0 = 7'b1111000; //7
		4'b1000: Display0 = 7'b0000000; //8
		4'b1001: Display0 = 7'b0010000; //9
		endcase 
end 
endmodule

module Dong_Ho(CLOCK_50, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR);
input [17:0]SW;
input CLOCK_50;
output [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output [0:0]LEDR;

wire [3:0]A,B,C,D,E,F;
integer q;
reg clock_1s = 1'b0; 

always @(posedge CLOCK_50)
begin
	q = q+1;
	if (q == 25000000)
	begin 
		clock_1s = ~clock_1s;
		q = 0;
	end  
end
			BCD_counter(clock_1s,SW[0], A, B, C, D, E, F, SW[1], SW[17:2], LEDR[0]);
			giaimaled7seg(A,HEX5); //bcd1
			giaimaled7seg(B,HEX4); //bcd2
			giaimaled7seg(C,HEX3); //bcd3
			giaimaled7seg(D,HEX2); //bcd4
			giaimaled7seg(E,HEX1); //bcd5
			giaimaled7seg(F,HEX0); //bcd6
endmodule 