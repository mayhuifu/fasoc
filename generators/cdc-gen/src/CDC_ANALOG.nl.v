module CDC_ANALOG (PRECHARGE, PRECHARGEB, in_vin, IN, INB, OSEN, LCOUT);
inout in_vin;
input  PRECHARGE, PRECHARGEB, IN, INB;
output OSEN, LCOUT;


wire pre;

INVCHAIN_ISOVDD a_iniso_0 (.IN(LCOUT), .OUT(OSEN)); 
//INVCHAIN a_iniso_1 (.IN(LCOUT), .OUT(OREF));

PRECHARGEX1 a_precharge_1 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_2 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_3 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_4 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_5 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_6 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_7 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_8 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_9 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_10 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_11 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_12 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_13 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_14 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_15 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_16 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_17 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_18 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_19 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_20 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_21 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_22 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_23 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_24 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_25 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_26 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_27 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_28 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_29 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_30 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_31 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_32 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_33 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_34 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_35 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_36 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_37 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_38 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_39 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_40 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_41 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_42 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_43 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_44 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_45 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_46 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_47 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_48 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_49 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_50 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_51 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_52 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_53 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_54 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_55 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_56 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_57 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_58 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_59 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_60 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_61 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_62 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_63 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_64 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_65 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_66 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_67 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_68 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_69 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_70 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_71 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_72 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_73 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_74 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_75 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_76 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_77 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_78 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_79 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_80 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_81 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_82 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_83 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_84 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_85 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_86 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_87 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_88 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_89 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_90 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_91 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_92 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_93 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_94 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_95 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_96 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_97 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_98 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_99 (.IN(pre), .VIN(in_vin));
PRECHARGEX1 a_precharge_100 (.IN(pre), .VIN(in_vin));

SLC_cell a_lc_2 (.A(PRECHARGE), .AB(PRECHARGEB), .Y(pre));
SLC_cell a_lc_1 (.A(IN), .AB(INB), .Y(LCOUT));


//BUFX4HVT_ISOVDD a_buf_0 (.A(lc_out), .Y(LCOUT));
//BUFX4HVT a_buf_1 (.A(IN), .Y(in_buf));
//INVX1HVT a_inv_0 (.A(IN), .Y(inb));
//BUFX4HVT_ISOVDD a_buf_2 (.A(inb), .Y(inb_buf));:13

endmodule

