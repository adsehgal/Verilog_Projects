module Edge_Detector(
    input   btn,
    input   clk,
    output  Edet
    );
    wire    [1:0]edgeout;
    
    FDRE    #(.INIT(1'b0))   edge1   (.C(clk), .R(reset), .CE(enable), .D(btn), .Q(edgeout[1]));
    FDRE    #(.INIT(1'b0))   edge0   (.C(clk), .R(reset), .CE(enable), .D(edgeout[1]), .Q(edgeout[0]));
    
    assign  Edet = (edgeout[1] & ~edgeout[0]);
    assign  enable = 1'b1;
endmodule