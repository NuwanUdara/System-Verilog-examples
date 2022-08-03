module test_rp;
    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg cin;

    // Outputs

    
    wire [31:0] out_put;
    wire cout;
    
    casc32 t1(a,b,cin,out_put,cout);

    initial begin
        
        a = 1123123418;
        b = 1231246534;
        cin = 1'b0;        
        #20;
        
        a = 1456536683;
        b = 1002341233;
        cin = 1'b1;        
        #20;
     
        a = 1878237182;
        b = 1023533232;
        cin = 1'b1;        
        #20;
        
        a = 4294967295;
        b = 0092357128;
        cin = 1'b0;        
        #20;
        #10 $stop;
    end

endmodule