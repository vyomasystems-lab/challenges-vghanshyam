`timescale 1ns / 1ps

module ring_oscillator_1(out1,out2,count,count1,count2,en,S,reset);
input en,reset;
input[1:0]S;
output out1,out2;
output [3:0] count;
output [3:0] count1;
output [3:0] count2; 



  ro1 ghanshyam1(en,y1);
  ro2 ghanshyam2(en,y2);
  ro3 ghanshyam3(en,y3);
  ro4 ghanshyam4(en,y4);
  ro5 ghanshyam5(en,y5);
  ro6 ghanshyam6(en,y6);
  ro7 ghanshyam7(en,y7);
  ro8 ghanshyam8(en,y8); 
  mux_4 ghanshu1(out1,S,y1,y2,y3,y4);
  mux_4_1 ghanshu2(out2,S,y5,y6,y7,y8);
  cac2 Gh2(out2,out1,en,reset,count2,count1);
  comp Gh1(count2, count1,count);
       

endmodule


module ro1(en,y1);
input en;
output y1;
 wire w1, w2, w3,w4,w5;  
		
		  
 and #1(w1, en, y1);
 not #1(w2, w1);
 not #1(w3, w2);
 not #1(w4,w3);
 not #1(w5, w4);
 not #1(y1, w5);
       
		
endmodule

module ro2(en,y2);
input en;
output y2;
 wire w1, w2, w3,w4,w5; 
 and #2(w1, en, y2);
 not #2(w2, w1);
 not #2(w3, w2);
 not #2(w4,w3);
 not #2(w5, w4);
 not #2(y2, w5);		
endmodule


module ro3(en,y3);
input en;
output y3;
 wire w1, w2, w3,w4,w5;
 and #3(w1, en, y3);
 not #3(w2, w1);
 not #3(w3, w2);
 not #3(w4,w3);
 not #3(w5, w4);
 not #3(y3, w5);	
endmodule


module ro4(en,y4);
input en;
output y4;
 wire w1, w2, w3,w4,w5;
 and #4(w1, en, y4);
 not #4(w2, w1);
 not #4(w3, w2);
 not #4(w4,w3);
 not #4(w5, w4);
 not #4(y4, w5);	
endmodule



module ro5(en,y5);
input en;
output y5;
 wire w1, w2, w3,w4,w5; 
 and #5(w1, en, y5);
 not #5(w2, w1);
 not #5(w3, w2);
 not #5(w4,w3);
 not #5(w5, w4);
 not #5(y5, w5);	
endmodule


module ro6(en,y6);
input en;
output y6;
 wire w1, w2, w3,w4,w5;
 and #6(w1, en,y6 );
 not #6(w2, w1);
 not #6(w3, w2);
 not #6(w4,w3);
 not #6(w5, w4);
 not #6(y6, w5);
endmodule


module ro7(en,y7);
input en;
output y7;
 wire w1, w2, w3,w4,w5;  
 and #7(w1, en, y7);
 not #7(w2, w1);
 not #7(w3, w2);
 not #7(w4,w3);
 not #7(w5, w4);
 not #7(y7, w5);	
endmodule



module ro8(en,y8);
input en;
output y8;
 wire w1, w2, w3,w4,w5; 
  and #8(w1, en, y8);
  not #8(w2, w1);
  not #8(w3, w2);
  not #8(w4,w3);
  not #8(w5, w4);
  not #8(y8, w5);
        
		
endmodule


module mux_4(out1,S,y1,y2,y3,y4);
input y1, y2,y3,y4;
input[1:0]S;
output out1;
assign out1 = y1 & ~S[1] & ~S[0] | y3 & ~S[1] & S[0] | y2 & S[1] & ~S[0] | y4 & S[1] & S[0];
endmodule
 

module mux_4_1(out2,S,y5,y6,y7,y8);
input y5, y6,y7,y8;
input[1:0]S;
output out2;
assign out2 = y5 & ~S[1] & ~S[0] | y7 & ~S[1] & S[0] | y6 & S[1] & ~S[0] | y8 & S[1] & S[0];
endmodule



module cac2(
    input c2, c1,
    input en , reset,
  output reg [3:0]count2 ,
  output reg [3:0]count1)  ;
    // initial begin count1=0;count2=0;end
	  
always@(posedge c2 or posedge reset)
begin
		if(reset)
		begin
			count2 <= 0;
		end	
					 
		else if(en & !(&count1) & !(&count2))
		begin
			count2 <= count2 + 1;
		end	

end				

always@(posedge c1 or posedge reset)
begin
		if(reset)
		begin
			count1 <= 0;
		end	
					 
		else if(en & !(&count1) & !(&count2))
		begin
			count1 <= count1 + 1;
		end	

end				

endmodule
  
  
