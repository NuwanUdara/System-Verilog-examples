module casCLA (inp1,inp2,cin,sum_l,cout_l);

    input [31:0] inp1;
    input [31:0] inp2;

    input cin;

    output [31:0] sum_l;
    output cout_l;

    wire [2:0] rip;

    CLA a1(inp1[7:0],inp2[7:0],cin,sum_l[7:0],rip[0]);
    CLA a2(inp1[15:8],inp2[15:8],rip[0],sum_l[15:8],rip[1]);
    CLA a3(inp1[23:16],inp2[23:16],rip[1],sum_l[23:16],rip[2]);
    CLA a4(inp1[31:24],inp2[31:24],rip[2],sum_l[31:24],cout_l);

endmodule



module CLA (a,b,cin,sum,cout);

input [7:0] a;
input [7:0] b;

input cin;

output [7:0] sum;
output cout;

wire [7:0] c;
wire [7:0] p;
wire [7:0] g;


assign g[0] =a[0]&b[0];
assign g[1] =a[1]&b[1];
assign g[2] =a[2]&b[2];
assign g[3] =a[3]&b[3];
assign g[4] =a[4]&b[4];
assign g[5] =a[5]&b[5];
assign g[6] =a[6]&b[6];
assign g[7] =a[7]&b[7];

assign p[0] =a[0]^b[0];
assign p[1] =a[1]^b[1];
assign p[2] =a[2]^b[2];
assign p[3] =a[3]^b[3];
assign p[4] =a[4]^b[4];
assign p[5] =a[5]^b[5];
assign p[6] =a[6]^b[6];
assign p[7] =a[7]^b[7];



assign c[0]=cin;

assign sum[0]=p[0] ^ cin;

assign c[1]=g[0]+(p[0]&cin);

assign sum[1]=p[1] ^ c[1];

assign c[2]=g[1] +(p[1]&g[0]) + (p[1]&p[0]&cin);

assign sum[2]=p[2] ^ c[2];

assign c[3]=g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0])+(p[2]&p[1]&p[0]&cin);

assign sum[3]=p[3] ^ c[3];

assign c[4]= g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0])+(p[3]&p[2]&p[1]&p[0]&cin);

assign sum[4]=p[4] ^ c[4];

assign c[5]= g[4] | (p[4]&g[3]) | (p[4]&p[3]&g[2]) | (p[4]&p[3]&p[2]&g[1]) | (p[4]&p[3]&p[2]&p[1]&g[0])+(p[4]&p[3]&p[2]&p[1]&p[0]&cin);

assign sum[5]=p[5] ^ c[5];

assign c[6]= g[5] | (p[5]&g[4]) | (p[4]&g[3]) | (p[4]&p[3]&g[2]) | (p[4]&p[3]&p[2]&g[1]) | (p[4]&p[3]&p[2]&p[1]&g[0])+(p[4]&p[3]&p[2]&p[1]&p[0]&cin);

assign sum[6]=p[6] ^ c[6];

assign c[7]= g[6] | (p[6]&g[5]) | (p[5]&g[4]) | (p[4]&g[3]) | (p[4]&p[3]&g[2]) | (p[4]&p[3]&p[2]&g[1]) | (p[4]&p[3]&p[2]&p[1]&g[0])+(p[4]&p[3]&p[2]&p[1]&p[0]&cin);
    
assign sum[7]=p[7] ^ c[7];

assign cout=c[7];



    
endmodule