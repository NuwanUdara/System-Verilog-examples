module test_CLA;
    // Inputs
    reg [31:0] inp1;
    reg [31:0] inp2;
    reg cin;

    // Outputs

    
    wire [31:0] sum_l;
    wire cout_l;
    

    casCLA b1(inp1,inp2,cin,sum_l,cout_l);
    
    initial begin
        
        inp1 = 1123123418;
        inp2 = 1231246534;
        cin = 1'b0;        
        #20;
        
        inp1 = 1456536683;
        inp2 = 1002341233;
        cin = 1'b1;        
        #20;
     
        inp1 = 1878237182;
        inp2 = 1023533232;
        cin = 1'b1;        
        #20;
        
        inp1 = 4294967295;
        inp2 = 0092357128;
        cin = 1'b0;        
        #20;
        #10 $stop;
    end

endmodule