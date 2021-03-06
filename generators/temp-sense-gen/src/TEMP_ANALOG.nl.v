module TEMP_ANALOG (EN, OUT, OUTB);
 input  EN;
// inout in_vin;
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
NAND2_X0P4N_A10P5PP84TR_C14 a_nand_0 ( .A(EN), .B(n7), .Y(n1));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_0 ( .A(n1), .Y(n2));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_1 ( .A(n2), .Y(n3));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_2 ( .A(n3), .Y(n4));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_3 ( .A(n4), .Y(n5));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_4 ( .A(n5), .Y(n6));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_5 ( .A(n6), .Y(n7));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_m1 ( .A(n7), .Y(nx1));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_m2 ( .A(n7), .Y(nx2));
INVP_X0P4N_A10P5PP84TR_C14 a_inv_m3 ( .A(nx2), .Y(nx3));
BUF_X0P4N_A10P5PP84TR_C14 a_buf_3 ( .A(nx3), .Y(nb2));
BUF_X0P4N_A10P5PP84TR_C14 a_buf_0 ( .A(nx1), .Y(nb1));
BUF_X0P4N_A10P5PP84TR_C14 a_buf_1 ( .A(nb1), .Y(OUT));
BUF_X0P4N_A10P5PP84TR_C14 a_buf_2 ( .A(nb2), .Y(OUTB));
HEAD14 a_header_0(.VIN(VVDD));
HEAD14 a_header_1(.VIN(VVDD));
HEAD14 a_header_2(.VIN(VVDD));
HEAD14 a_header_3(.VIN(VVDD));
HEAD14 a_header_4(.VIN(VVDD));
HEAD14 a_header_5(.VIN(VVDD));
HEAD14 a_header_6(.VIN(VVDD));

endmodule
