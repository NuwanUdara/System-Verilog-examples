`timescale 1ns / 1ps

module pip_test;
    // Inputs
    reg [31:0] in1;
    reg [31:0] in2;
    reg cin, clk;

    // Outputs
    wire [31:0] ad;
    wire cout;
    
    pipline a(clk,in1,in2,cin,ad,cout);

    //PipelineAdder Adder(clk, A, B, Cin, S, Cout);
    initial begin
        
        in1 = 124532445;
        in2 = 212421455;
        cin = 0;        
        clk = 0;#5;clk = 1;#5;
        
        in1 = 142352352;
        in2 = 465693463;
        cin = 0;
        clk = 0;#5;clk = 1;#5;
     
        in1 = 847583573;
        in2 = 347583488;
        cin = 0;
        clk = 0;#5;clk = 1;#5;
        
        in1 = 573286762;
        in2 = 235762376;
        cin = 0;
        clk = 0;#5;clk = 1;#5;
        clk = 0;#5;clk = 1;#5;
        clk = 0;#5;clk = 1;#5;
        $stop;
        
    end
endmodule
