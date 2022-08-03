module pipline (clk,in1,in2,cin,ad,cout);

input clk;

input [31:0] in1;
input [31:0] in2;
input cin;

output [31:0] ad;
output cout;

reg [7:0] s1_1,s1_2,s1_3;
reg [7:0] s2_a1,s2_b1,s2_2,s2_3;
reg [7:0] s3_a1,s3_b1,s3_a2,s3_b2,s3_3;
reg [7:0] s4_a1,s4_b1,s4_a2,s4_b2,s4_a3,s4_b3;
reg [2:0] ep;

wire [7:0] aa,bb,cc,dd;

wire [2:0] epp;

always @(posedge clk) 
    begin
        //__________________________
        
        s1_1 <= aa;
        s1_2 <= s1_1;
        s1_3 <= s1_2;
        //ad[7:0] = s1_3;
        ep[0] <= epp[0];

        //___________________________
        
        s2_a1 <= in1[15:8];
        s2_b1 <= in2[15:8];

        ep[1] <= epp[0];
        s2_2 <= bb;
        s2_3 <=s2_2;
        //ad[15:8] = s2_3;
        
        //___________________________
        
        s3_a1 <= in1[23:16];
        s3_b1 <= in2[23:16];
        s3_a2 <= s3_a1;
        s3_b2 <= s3_b1;

        ep[2] <= epp[2];
        s3_3 <= cc;
        //ad[23:16] = s3_3;
        
        //____________________________

        s4_a1 <= in1[31:24];
        s4_b1 <= in2[31:24];
        s4_a2 <= s4_a1;
        s4_b2 <= s4_b1;
        s4_a3 <= s4_a2;
        s4_b3 <= s4_b2;

        //ad[31:24] = dd;




    
    end
assign ad[7:0] = s1_3;
assign ad[15:8] = s2_3;
assign ad[23:16] = s3_3;
assign ad[31:24] = dd;

ripplemod l1(in1[7:0],in2[7:0],cin,aa,epp[0]);

ripplemod l2(s2_a1,s2_b1,ep[0],bb,epp[1]);

ripplemod l3(s3_a2,s3_b2,ep[1],cc,epp[2]);

ripplemod l4(s4_a3,s4_b3,ep[2],dd,cout);
    
endmodule


module ripplemod(a, b, cin, sum, cout);

input [07:0] a;

input [07:0] b;

input cin;

output [7:0]sum;

output cout;

wire[6:0] c;

fulladd a1(a[0],b[0],cin,sum[0],c[0]);

fulladd a2(a[1],b[1],c[0],sum[1],c[1]);

fulladd a3(a[2],b[2],c[1],sum[2],c[2]);

fulladd a4(a[3],b[3],c[2],sum[3],c[3]);

fulladd a5(a[4],b[4],c[3],sum[4],c[4]);

fulladd a6(a[5],b[5],c[4],sum[5],c[5]);

fulladd a7(a[6],b[6],c[5],sum[6],c[6]);

fulladd a8(a[7],b[7],c[6],sum[7],cout);

endmodule

 

module fulladd(a, b, cin, sum, cout);

input a;

input b;

input cin;

output sum;

output cout;

assign sum=(a^b^cin);

assign cout=((a&b)|(b&cin)|(a&cin));

endmodule