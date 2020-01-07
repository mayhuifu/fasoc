module TEMP_ANALOG (EN, in_vin, OUT, OUTB);
 input  EN;
 inout in_vin;
 output OUT, OUTB;
 wire  n;
wire n1; 
wire n2; 
wire n3; 
wire n4; 
wire n5; 
wire n6; 
wire n7; 
wire nx1, nx2, nx3, nb1, nb2; 
NAND2X1RVT_ISOVDD a_nand_0 ( .A(EN), .B(n7), .VIN(in_vin), .Y(n1));
INVXRVT_ISOVDD a_inv_0 ( .A(n1), .VIN(in_vin), .Y(n2));
INVXRVT_ISOVDD a_inv_1 ( .A(n2), .VIN(in_vin), .Y(n3));
INVXRVT_ISOVDD a_inv_2 ( .A(n3), .VIN(in_vin), .Y(n4));
INVXRVT_ISOVDD a_inv_3 ( .A(n4), .VIN(in_vin), .Y(n5));
INVXRVT_ISOVDD a_inv_4 ( .A(n5), .VIN(in_vin), .Y(n6));
INVXRVT_ISOVDD a_inv_5 ( .A(n6), .VIN(in_vin), .Y(n7));
INVXRVT_ISOVDD a_inv_m1 ( .A(n7), .VIN(in_vin), .Y(nx1));
INVXRVT_ISOVDD a_inv_m2 ( .A(n7), .VIN(in_vin), .Y(nx2));
INVXRVT_ISOVDD a_inv_m3 ( .A(nx2), .VIN(in_vin), .Y(nx3));
BUFX4RVT_ISOVDD a_buf_3 ( .A(nx3), .VIN(in_vin), .Y(nb2));
BUFX4RVT_ISOVDD a_buf_0 ( .A(nx1), .VIN(in_vin), .Y(nb1));
BUFX4RVT_ISOVDD a_buf_1 ( .A(nb1), .VIN(in_vin), .Y(OUT));
BUFX4RVT_ISOVDD a_buf_2 ( .A(nb2), .VIN(in_vin), .Y(OUTB));
HEADERX1RVT a_header_0(.VIN(in_vin));
HEADERX1RVT a_header_1(.VIN(in_vin));
HEADERX1RVT a_header_2(.VIN(in_vin));
HEADERX1RVT a_header_3(.VIN(in_vin));
HEADERX1RVT a_header_4(.VIN(in_vin));
HEADERX1RVT a_header_5(.VIN(in_vin));
HEADERX1RVT a_header_6(.VIN(in_vin));

endmodule
