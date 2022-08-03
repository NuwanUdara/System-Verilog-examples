module casc32(a,b,cin,sum,coutt);
    input [31:0] a;
    
    input [31:0] b;

    input cin;

    output [31:0] sum;
    
    
    output coutt;


    wire e;
    wire p;
    wire q;

    ripplemod b1(a[7:0],b[7:0],cin,sum[7:0],e);

    ripplemod b2(a[15:8],b[15:8],e,sum[15:8],p);

    ripplemod b3(a[23:16],b[23:16],p,sum[23:16],q);

    ripplemod b4(a[31:24],b[31:24],q,sum[31:24],coutt);



    
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