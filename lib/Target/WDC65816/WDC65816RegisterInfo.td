//===- WDC65816RegisterInfo.td - WDC65816 Register defs ----*- tablegen -*-===//
// 
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
// 
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the WDC65816 register file 
//===----------------------------------------------------------------------===//

let Namespace = "WDC" in {
  def A : Register<"A">;
  def X : Register<"X">;
  def Y : Register<"Y">;
  def P : Register<"P">;
  def S : Register<"S">;
  def D : Register<"D">;
  def K : Register<"K">;
  def B : Register<"B">;
  def PC : Register<"PC">;
}


// Subregister indices.
let Namespace = "WDC" in {
    def sub_16bit_lo   : SubRegIndex<16>;
    def sub_16bit_hi   : SubRegIndex<16>;
    def sub_32bit      : SubRegIndex<32>;
    def sub_32bit_lo   : SubRegIndex<32>;
    def sub_32bit_hi   : SubRegIndex<32>;
    def sub_64bit      : SubRegIndex<64>;
}


class WDCDpReg<string n, bits<16>val, list<Register> subregs = []> : Register<n> {
    let Namespace = "WDC";
    let HWEncoding = val;
    let SubRegs = subregs;
}

def dpI16_0 : WDCDpReg<"dpI16_0", 0>;
def dpI16_1 : WDCDpReg<"dpI16_1", 2>;
def dpI16_2 : WDCDpReg<"dpI16_2", 4>;
def dpI16_3 : WDCDpReg<"dpI16_3", 6>;
def dpI16_4 : WDCDpReg<"dpI16_4", 8>;
def dpI16_5 : WDCDpReg<"dpI16_5", 10>;
def dpI16_6 : WDCDpReg<"dpI16_6", 12>;
def dpI16_7 : WDCDpReg<"dpI16_7", 14>;
def dpI16_8 : WDCDpReg<"dpI16_8", 16>;
def dpI16_9 : WDCDpReg<"dpI16_9", 18>;
def dpI16_10 : WDCDpReg<"dpI16_10", 20>;
def dpI16_11 : WDCDpReg<"dpI16_11", 22>;
def dpI16_12 : WDCDpReg<"dpI16_12", 24>;
def dpI16_13 : WDCDpReg<"dpI16_13", 26>;
def dpI16_14 : WDCDpReg<"dpI16_14", 28>;
def dpI16_15 : WDCDpReg<"dpI16_15", 30>;
def dpI16_16 : WDCDpReg<"dpI16_16", 32>;
def dpI16_17 : WDCDpReg<"dpI16_17", 34>;
def dpI16_18 : WDCDpReg<"dpI16_18", 36>;
def dpI16_19 : WDCDpReg<"dpI16_19", 38>;
def dpI16_20 : WDCDpReg<"dpI16_20", 40>;
def dpI16_21 : WDCDpReg<"dpI16_21", 42>;
def dpI16_22 : WDCDpReg<"dpI16_22", 44>;
def dpI16_23 : WDCDpReg<"dpI16_23", 46>;
def dpI16_24 : WDCDpReg<"dpI16_24", 48>;
def dpI16_25 : WDCDpReg<"dpI16_25", 50>;
def dpI16_26 : WDCDpReg<"dpI16_26", 52>;
def dpI16_27 : WDCDpReg<"dpI16_27", 54>;
def dpI16_28 : WDCDpReg<"dpI16_28", 56>;
def dpI16_29 : WDCDpReg<"dpI16_29", 58>;
def dpI16_30 : WDCDpReg<"dpI16_30", 60>;
def dpI16_31 : WDCDpReg<"dpI16_31", 62>;
def dpI16_32 : WDCDpReg<"dpI16_32", 64>;
def dpI16_33 : WDCDpReg<"dpI16_33", 66>;
def dpI16_34 : WDCDpReg<"dpI16_34", 68>;
def dpI16_35 : WDCDpReg<"dpI16_35", 70>;
def dpI16_36 : WDCDpReg<"dpI16_36", 72>;
def dpI16_37 : WDCDpReg<"dpI16_37", 74>;
def dpI16_38 : WDCDpReg<"dpI16_38", 76>;
def dpI16_39 : WDCDpReg<"dpI16_39", 78>;
def dpI16_40 : WDCDpReg<"dpI16_40", 80>;
def dpI16_41 : WDCDpReg<"dpI16_41", 82>;
def dpI16_42 : WDCDpReg<"dpI16_42", 84>;
def dpI16_43 : WDCDpReg<"dpI16_43", 86>;
def dpI16_44 : WDCDpReg<"dpI16_44", 88>;
def dpI16_45 : WDCDpReg<"dpI16_45", 90>;
def dpI16_46 : WDCDpReg<"dpI16_46", 92>;
def dpI16_47 : WDCDpReg<"dpI16_47", 94>;
def dpI16_48 : WDCDpReg<"dpI16_48", 96>;
def dpI16_49 : WDCDpReg<"dpI16_49", 98>;
def dpI16_50 : WDCDpReg<"dpI16_50", 100>;
def dpI16_51 : WDCDpReg<"dpI16_51", 102>;
def dpI16_52 : WDCDpReg<"dpI16_52", 104>;
def dpI16_53 : WDCDpReg<"dpI16_53", 106>;
def dpI16_54 : WDCDpReg<"dpI16_54", 108>;
def dpI16_55 : WDCDpReg<"dpI16_55", 110>;
def dpI16_56 : WDCDpReg<"dpI16_56", 112>;
def dpI16_57 : WDCDpReg<"dpI16_57", 114>;
def dpI16_58 : WDCDpReg<"dpI16_58", 116>;
def dpI16_59 : WDCDpReg<"dpI16_59", 118>;
def dpI16_60 : WDCDpReg<"dpI16_60", 120>;
def dpI16_61 : WDCDpReg<"dpI16_61", 122>;
def dpI16_62 : WDCDpReg<"dpI16_62", 124>;
def dpI16_63 : WDCDpReg<"dpI16_63", 126>;
def dpI16_64 : WDCDpReg<"dpI16_64", 128>;
def dpI16_65 : WDCDpReg<"dpI16_65", 130>;
def dpI16_66 : WDCDpReg<"dpI16_66", 132>;
def dpI16_67 : WDCDpReg<"dpI16_67", 134>;
def dpI16_68 : WDCDpReg<"dpI16_68", 136>;
def dpI16_69 : WDCDpReg<"dpI16_69", 138>;
def dpI16_70 : WDCDpReg<"dpI16_70", 140>;
def dpI16_71 : WDCDpReg<"dpI16_71", 142>;
def dpI16_72 : WDCDpReg<"dpI16_72", 144>;
def dpI16_73 : WDCDpReg<"dpI16_73", 146>;
def dpI16_74 : WDCDpReg<"dpI16_74", 148>;
def dpI16_75 : WDCDpReg<"dpI16_75", 150>;
def dpI16_76 : WDCDpReg<"dpI16_76", 152>;
def dpI16_77 : WDCDpReg<"dpI16_77", 154>;
def dpI16_78 : WDCDpReg<"dpI16_78", 156>;
def dpI16_79 : WDCDpReg<"dpI16_79", 158>;
def dpI16_80 : WDCDpReg<"dpI16_80", 160>;
def dpI16_81 : WDCDpReg<"dpI16_81", 162>;
def dpI16_82 : WDCDpReg<"dpI16_82", 164>;
def dpI16_83 : WDCDpReg<"dpI16_83", 166>;
def dpI16_84 : WDCDpReg<"dpI16_84", 168>;
def dpI16_85 : WDCDpReg<"dpI16_85", 170>;
def dpI16_86 : WDCDpReg<"dpI16_86", 172>;
def dpI16_87 : WDCDpReg<"dpI16_87", 174>;
def dpI16_88 : WDCDpReg<"dpI16_88", 176>;
def dpI16_89 : WDCDpReg<"dpI16_89", 178>;
def dpI16_90 : WDCDpReg<"dpI16_90", 180>;
def dpI16_91 : WDCDpReg<"dpI16_91", 182>;
def dpI16_92 : WDCDpReg<"dpI16_92", 184>;
def dpI16_93 : WDCDpReg<"dpI16_93", 186>;
def dpI16_94 : WDCDpReg<"dpI16_94", 188>;
def dpI16_95 : WDCDpReg<"dpI16_95", 190>;
def dpI16_96 : WDCDpReg<"dpI16_96", 192>;
def dpI16_97 : WDCDpReg<"dpI16_97", 194>;
def dpI16_98 : WDCDpReg<"dpI16_98", 196>;
def dpI16_99 : WDCDpReg<"dpI16_99", 198>;
def dpI16_100 : WDCDpReg<"dpI16_100", 200>;
def dpI16_101 : WDCDpReg<"dpI16_101", 202>;
def dpI16_102 : WDCDpReg<"dpI16_102", 204>;
def dpI16_103 : WDCDpReg<"dpI16_103", 206>;
def dpI16_104 : WDCDpReg<"dpI16_104", 208>;
def dpI16_105 : WDCDpReg<"dpI16_105", 210>;
def dpI16_106 : WDCDpReg<"dpI16_106", 212>;
def dpI16_107 : WDCDpReg<"dpI16_107", 214>;
def dpI16_108 : WDCDpReg<"dpI16_108", 216>;
def dpI16_109 : WDCDpReg<"dpI16_109", 218>;
def dpI16_110 : WDCDpReg<"dpI16_110", 220>;
def dpI16_111 : WDCDpReg<"dpI16_111", 222>;
def dpI16_112 : WDCDpReg<"dpI16_112", 224>;
def dpI16_113 : WDCDpReg<"dpI16_113", 226>;
def dpI16_114 : WDCDpReg<"dpI16_114", 228>;
def dpI16_115 : WDCDpReg<"dpI16_115", 230>;
def dpI16_116 : WDCDpReg<"dpI16_116", 232>;
def dpI16_117 : WDCDpReg<"dpI16_117", 234>;
def dpI16_118 : WDCDpReg<"dpI16_118", 236>;
def dpI16_119 : WDCDpReg<"dpI16_119", 238>;
def dpI16_120 : WDCDpReg<"dpI16_120", 240>;
def dpI16_121 : WDCDpReg<"dpI16_121", 242>;
def dpI16_122 : WDCDpReg<"dpI16_122", 244>;
def dpI16_123 : WDCDpReg<"dpI16_123", 246>;
def dpI16_124 : WDCDpReg<"dpI16_124", 248>;
def dpI16_125 : WDCDpReg<"dpI16_125", 250>;
def dpI16_126 : WDCDpReg<"dpI16_126", 252>;
def dpI16_127 : WDCDpReg<"dpI16_127", 254>;


let SubRegIndices = [sub_16bit_lo, sub_16bit_hi], CoveredBySubRegs = 1 in {
def dpI32_0 : WDCDpReg<"dpI32_0", 0, [dpI16_0, dpI16_1]>;           // This is reserved as the frame pointer!
def dpI32_1 : WDCDpReg<"dpI32_1", 4, [dpI16_2, dpI16_3]>;
def dpI32_2 : WDCDpReg<"dpI32_2", 8, [dpI16_4, dpI16_5]>;
def dpI32_3 : WDCDpReg<"dpI32_3", 12, [dpI16_6, dpI16_7]>;
def dpI32_4 : WDCDpReg<"dpI32_4", 16, [dpI16_8, dpI16_9]>;
def dpI32_5 : WDCDpReg<"dpI32_5", 20, [dpI16_10, dpI16_11]>;
def dpI32_6 : WDCDpReg<"dpI32_6", 24, [dpI16_12, dpI16_13]>;
def dpI32_7 : WDCDpReg<"dpI32_7", 28, [dpI16_14, dpI16_15]>;
def dpI32_8 : WDCDpReg<"dpI32_8", 32, [dpI16_16, dpI16_17]>;
def dpI32_9 : WDCDpReg<"dpI32_9", 36, [dpI16_18, dpI16_19]>;
def dpI32_10 : WDCDpReg<"dpI32_10", 40, [dpI16_20, dpI16_21]>;
def dpI32_11 : WDCDpReg<"dpI32_11", 44, [dpI16_22, dpI16_23]>;
def dpI32_12 : WDCDpReg<"dpI32_12", 48, [dpI16_24, dpI16_25]>;
def dpI32_13 : WDCDpReg<"dpI32_13", 52, [dpI16_26, dpI16_27]>;
def dpI32_14 : WDCDpReg<"dpI32_14", 56, [dpI16_28, dpI16_29]>;
def dpI32_15 : WDCDpReg<"dpI32_15", 60, [dpI16_30, dpI16_31]>;
def dpI32_16 : WDCDpReg<"dpI32_16", 64, [dpI16_32, dpI16_33]>;
def dpI32_17 : WDCDpReg<"dpI32_17", 68, [dpI16_34, dpI16_35]>;
def dpI32_18 : WDCDpReg<"dpI32_18", 72, [dpI16_36, dpI16_37]>;
def dpI32_19 : WDCDpReg<"dpI32_19", 76, [dpI16_38, dpI16_39]>;
def dpI32_20 : WDCDpReg<"dpI32_20", 80, [dpI16_40, dpI16_41]>;
def dpI32_21 : WDCDpReg<"dpI32_21", 84, [dpI16_42, dpI16_43]>;
def dpI32_22 : WDCDpReg<"dpI32_22", 88, [dpI16_44, dpI16_45]>;
def dpI32_23 : WDCDpReg<"dpI32_23", 92, [dpI16_46, dpI16_47]>;
def dpI32_24 : WDCDpReg<"dpI32_24", 96, [dpI16_48, dpI16_49]>;
def dpI32_25 : WDCDpReg<"dpI32_25", 100, [dpI16_50, dpI16_51]>;
def dpI32_26 : WDCDpReg<"dpI32_26", 104, [dpI16_52, dpI16_53]>;
def dpI32_27 : WDCDpReg<"dpI32_27", 108, [dpI16_54, dpI16_55]>;
def dpI32_28 : WDCDpReg<"dpI32_28", 112, [dpI16_56, dpI16_57]>;
def dpI32_29 : WDCDpReg<"dpI32_29", 116, [dpI16_58, dpI16_59]>;
def dpI32_30 : WDCDpReg<"dpI32_30", 120, [dpI16_60, dpI16_61]>;
def dpI32_31 : WDCDpReg<"dpI32_31", 124, [dpI16_62, dpI16_63]>;
def dpI32_32 : WDCDpReg<"dpI32_32", 128, [dpI16_64, dpI16_65]>;
def dpI32_33 : WDCDpReg<"dpI32_33", 132, [dpI16_66, dpI16_67]>;
def dpI32_34 : WDCDpReg<"dpI32_34", 136, [dpI16_68, dpI16_69]>;
def dpI32_35 : WDCDpReg<"dpI32_35", 140, [dpI16_70, dpI16_71]>;
def dpI32_36 : WDCDpReg<"dpI32_36", 144, [dpI16_72, dpI16_73]>;
def dpI32_37 : WDCDpReg<"dpI32_37", 148, [dpI16_74, dpI16_75]>;
def dpI32_38 : WDCDpReg<"dpI32_38", 152, [dpI16_76, dpI16_77]>;
def dpI32_39 : WDCDpReg<"dpI32_39", 156, [dpI16_78, dpI16_79]>;
def dpI32_40 : WDCDpReg<"dpI32_40", 160, [dpI16_80, dpI16_81]>;
def dpI32_41 : WDCDpReg<"dpI32_41", 164, [dpI16_82, dpI16_83]>;
def dpI32_42 : WDCDpReg<"dpI32_42", 168, [dpI16_84, dpI16_85]>;
def dpI32_43 : WDCDpReg<"dpI32_43", 172, [dpI16_86, dpI16_87]>;
def dpI32_44 : WDCDpReg<"dpI32_44", 176, [dpI16_88, dpI16_89]>;
def dpI32_45 : WDCDpReg<"dpI32_45", 180, [dpI16_90, dpI16_91]>;
def dpI32_46 : WDCDpReg<"dpI32_46", 184, [dpI16_92, dpI16_93]>;
def dpI32_47 : WDCDpReg<"dpI32_47", 188, [dpI16_94, dpI16_95]>;
def dpI32_48 : WDCDpReg<"dpI32_48", 192, [dpI16_96, dpI16_97]>;
def dpI32_49 : WDCDpReg<"dpI32_49", 196, [dpI16_98, dpI16_99]>;
def dpI32_50 : WDCDpReg<"dpI32_50", 200, [dpI16_100, dpI16_101]>;
def dpI32_51 : WDCDpReg<"dpI32_51", 204, [dpI16_102, dpI16_103]>;
def dpI32_52 : WDCDpReg<"dpI32_52", 208, [dpI16_104, dpI16_105]>;
def dpI32_53 : WDCDpReg<"dpI32_53", 212, [dpI16_106, dpI16_107]>;
def dpI32_54 : WDCDpReg<"dpI32_54", 216, [dpI16_108, dpI16_109]>;
def dpI32_55 : WDCDpReg<"dpI32_55", 220, [dpI16_110, dpI16_111]>;
def dpI32_56 : WDCDpReg<"dpI32_56", 224, [dpI16_112, dpI16_113]>;
def dpI32_57 : WDCDpReg<"dpI32_57", 228, [dpI16_114, dpI16_115]>;
def dpI32_58 : WDCDpReg<"dpI32_58", 232, [dpI16_116, dpI16_117]>;
def dpI32_59 : WDCDpReg<"dpI32_59", 236, [dpI16_118, dpI16_119]>;
def dpI32_60 : WDCDpReg<"dpI32_60", 240, [dpI16_120, dpI16_121]>;
def dpI32_61 : WDCDpReg<"dpI32_61", 244, [dpI16_122, dpI16_123]>;
def dpI32_62 : WDCDpReg<"dpI32_62", 248, [dpI16_124, dpI16_125]>;
def dpI32_63 : WDCDpReg<"dpI32_63", 252, [dpI16_126, dpI16_127]>;
}


let SubRegIndices = [sub_32bit], CoveredBySubRegs = 1 in {
def dpF32_0 : WDCDpReg<"dpF32_0", 0, [dpI32_0]>;
def dpF32_1 : WDCDpReg<"dpF32_1", 4, [dpI32_1]>;
def dpF32_2 : WDCDpReg<"dpF32_2", 8, [dpI32_2]>;
def dpF32_3 : WDCDpReg<"dpF32_3", 12, [dpI32_3]>;
def dpF32_4 : WDCDpReg<"dpF32_4", 16, [dpI32_4]>;
def dpF32_5 : WDCDpReg<"dpF32_5", 20, [dpI32_5]>;
def dpF32_6 : WDCDpReg<"dpF32_6", 24, [dpI32_6]>;
def dpF32_7 : WDCDpReg<"dpF32_7", 28, [dpI32_7]>;
def dpF32_8 : WDCDpReg<"dpF32_8", 32, [dpI32_8]>;
def dpF32_9 : WDCDpReg<"dpF32_9", 36, [dpI32_9]>;
def dpF32_10 : WDCDpReg<"dpF32_10", 40, [dpI32_10]>;
def dpF32_11 : WDCDpReg<"dpF32_11", 44, [dpI32_11]>;
def dpF32_12 : WDCDpReg<"dpF32_12", 48, [dpI32_12]>;
def dpF32_13 : WDCDpReg<"dpF32_13", 52, [dpI32_13]>;
def dpF32_14 : WDCDpReg<"dpF32_14", 56, [dpI32_14]>;
def dpF32_15 : WDCDpReg<"dpF32_15", 60, [dpI32_15]>;
def dpF32_16 : WDCDpReg<"dpF32_16", 64, [dpI32_16]>;
def dpF32_17 : WDCDpReg<"dpF32_17", 68, [dpI32_17]>;
def dpF32_18 : WDCDpReg<"dpF32_18", 72, [dpI32_18]>;
def dpF32_19 : WDCDpReg<"dpF32_19", 76, [dpI32_19]>;
def dpF32_20 : WDCDpReg<"dpF32_20", 80, [dpI32_20]>;
def dpF32_21 : WDCDpReg<"dpF32_21", 84, [dpI32_21]>;
def dpF32_22 : WDCDpReg<"dpF32_22", 88, [dpI32_22]>;
def dpF32_23 : WDCDpReg<"dpF32_23", 92, [dpI32_23]>;
def dpF32_24 : WDCDpReg<"dpF32_24", 96, [dpI32_24]>;
def dpF32_25 : WDCDpReg<"dpF32_25", 100, [dpI32_25]>;
def dpF32_26 : WDCDpReg<"dpF32_26", 104, [dpI32_26]>;
def dpF32_27 : WDCDpReg<"dpF32_27", 108, [dpI32_27]>;
def dpF32_28 : WDCDpReg<"dpF32_28", 112, [dpI32_28]>;
def dpF32_29 : WDCDpReg<"dpF32_29", 116, [dpI32_29]>;
def dpF32_30 : WDCDpReg<"dpF32_30", 120, [dpI32_30]>;
def dpF32_31 : WDCDpReg<"dpF32_31", 124, [dpI32_31]>;
def dpF32_32 : WDCDpReg<"dpF32_32", 128, [dpI32_32]>;
def dpF32_33 : WDCDpReg<"dpF32_33", 132, [dpI32_33]>;
def dpF32_34 : WDCDpReg<"dpF32_34", 136, [dpI32_34]>;
def dpF32_35 : WDCDpReg<"dpF32_35", 140, [dpI32_35]>;
def dpF32_36 : WDCDpReg<"dpF32_36", 144, [dpI32_36]>;
def dpF32_37 : WDCDpReg<"dpF32_37", 148, [dpI32_37]>;
def dpF32_38 : WDCDpReg<"dpF32_38", 152, [dpI32_38]>;
def dpF32_39 : WDCDpReg<"dpF32_39", 156, [dpI32_39]>;
def dpF32_40 : WDCDpReg<"dpF32_40", 160, [dpI32_40]>;
def dpF32_41 : WDCDpReg<"dpF32_41", 164, [dpI32_41]>;
def dpF32_42 : WDCDpReg<"dpF32_42", 168, [dpI32_42]>;
def dpF32_43 : WDCDpReg<"dpF32_43", 172, [dpI32_43]>;
def dpF32_44 : WDCDpReg<"dpF32_44", 176, [dpI32_44]>;
def dpF32_45 : WDCDpReg<"dpF32_45", 180, [dpI32_45]>;
def dpF32_46 : WDCDpReg<"dpF32_46", 184, [dpI32_46]>;
def dpF32_47 : WDCDpReg<"dpF32_47", 188, [dpI32_47]>;
def dpF32_48 : WDCDpReg<"dpF32_48", 192, [dpI32_48]>;
def dpF32_49 : WDCDpReg<"dpF32_49", 196, [dpI32_49]>;
def dpF32_50 : WDCDpReg<"dpF32_50", 200, [dpI32_50]>;
def dpF32_51 : WDCDpReg<"dpF32_51", 204, [dpI32_51]>;
def dpF32_52 : WDCDpReg<"dpF32_52", 208, [dpI32_52]>;
def dpF32_53 : WDCDpReg<"dpF32_53", 212, [dpI32_53]>;
def dpF32_54 : WDCDpReg<"dpF32_54", 216, [dpI32_54]>;
def dpF32_55 : WDCDpReg<"dpF32_55", 220, [dpI32_55]>;
def dpF32_56 : WDCDpReg<"dpF32_56", 224, [dpI32_56]>;
def dpF32_57 : WDCDpReg<"dpF32_57", 228, [dpI32_57]>;
def dpF32_58 : WDCDpReg<"dpF32_58", 232, [dpI32_58]>;
def dpF32_59 : WDCDpReg<"dpF32_59", 236, [dpI32_59]>;
def dpF32_60 : WDCDpReg<"dpF32_60", 240, [dpI32_60]>;
def dpF32_61 : WDCDpReg<"dpF32_61", 244, [dpI32_61]>;
def dpF32_62 : WDCDpReg<"dpF32_62", 248, [dpI32_62]>;
def dpF32_63 : WDCDpReg<"dpF32_63", 252, [dpI32_63]>;
}


let SubRegIndices = [sub_32bit_lo, sub_32bit_hi], CoveredBySubRegs = 1 in {
def dpI64_0 : WDCDpReg<"dpI64_0", 0, [dpI32_0, dpI32_1]>;
def dpI64_1 : WDCDpReg<"dpI64_1", 8, [dpI32_2, dpI32_3]>;
def dpI64_2 : WDCDpReg<"dpI64_2", 16, [dpI32_4, dpI32_5]>;
def dpI64_3 : WDCDpReg<"dpI64_3", 24, [dpI32_6, dpI32_7]>;
def dpI64_4 : WDCDpReg<"dpI64_4", 32, [dpI32_8, dpI32_9]>;
def dpI64_5 : WDCDpReg<"dpI64_5", 40, [dpI32_10, dpI32_11]>;
def dpI64_6 : WDCDpReg<"dpI64_6", 48, [dpI32_12, dpI32_13]>;
def dpI64_7 : WDCDpReg<"dpI64_7", 56, [dpI32_14, dpI32_15]>;
def dpI64_8 : WDCDpReg<"dpI64_8", 64, [dpI32_16, dpI32_17]>;
def dpI64_9 : WDCDpReg<"dpI64_9", 72, [dpI32_18, dpI32_19]>;
def dpI64_10 : WDCDpReg<"dpI64_10", 80, [dpI32_20, dpI32_21]>;
def dpI64_11 : WDCDpReg<"dpI64_11", 88, [dpI32_22, dpI32_23]>;
def dpI64_12 : WDCDpReg<"dpI64_12", 96, [dpI32_24, dpI32_25]>;
def dpI64_13 : WDCDpReg<"dpI64_13", 104, [dpI32_26, dpI32_27]>;
def dpI64_14 : WDCDpReg<"dpI64_14", 112, [dpI32_28, dpI32_29]>;
def dpI64_15 : WDCDpReg<"dpI64_15", 120, [dpI32_30, dpI32_31]>;
def dpI64_16 : WDCDpReg<"dpI64_16", 128, [dpI32_32, dpI32_33]>;
def dpI64_17 : WDCDpReg<"dpI64_17", 136, [dpI32_34, dpI32_35]>;
def dpI64_18 : WDCDpReg<"dpI64_18", 144, [dpI32_36, dpI32_37]>;
def dpI64_19 : WDCDpReg<"dpI64_19", 152, [dpI32_38, dpI32_39]>;
def dpI64_20 : WDCDpReg<"dpI64_20", 160, [dpI32_40, dpI32_41]>;
def dpI64_21 : WDCDpReg<"dpI64_21", 168, [dpI32_42, dpI32_43]>;
def dpI64_22 : WDCDpReg<"dpI64_22", 176, [dpI32_44, dpI32_45]>;
def dpI64_23 : WDCDpReg<"dpI64_23", 184, [dpI32_46, dpI32_47]>;
def dpI64_24 : WDCDpReg<"dpI64_24", 192, [dpI32_48, dpI32_49]>;
def dpI64_25 : WDCDpReg<"dpI64_25", 200, [dpI32_50, dpI32_51]>;
def dpI64_26 : WDCDpReg<"dpI64_26", 208, [dpI32_52, dpI32_53]>;
def dpI64_27 : WDCDpReg<"dpI64_27", 216, [dpI32_54, dpI32_55]>;
def dpI64_28 : WDCDpReg<"dpI64_28", 224, [dpI32_56, dpI32_57]>;
def dpI64_29 : WDCDpReg<"dpI64_29", 232, [dpI32_58, dpI32_59]>;
def dpI64_30 : WDCDpReg<"dpI64_30", 240, [dpI32_60, dpI32_61]>;
def dpI64_31 : WDCDpReg<"dpI64_31", 248, [dpI32_62, dpI32_63]>;
}


let SubRegIndices = [sub_64bit], CoveredBySubRegs = 1 in {
def dpF64_0 : WDCDpReg<"dpF64_0", 0, [dpI64_0]>;
def dpF64_1 : WDCDpReg<"dpF64_1", 8, [dpI64_1]>;
def dpF64_2 : WDCDpReg<"dpF64_2", 16, [dpI64_2]>;
def dpF64_3 : WDCDpReg<"dpF64_3", 24, [dpI64_3]>;
def dpF64_4 : WDCDpReg<"dpF64_4", 32, [dpI64_4]>;
def dpF64_5 : WDCDpReg<"dpF64_5", 40, [dpI64_5]>;
def dpF64_6 : WDCDpReg<"dpF64_6", 48, [dpI64_6]>;
def dpF64_7 : WDCDpReg<"dpF64_7", 56, [dpI64_7]>;
def dpF64_8 : WDCDpReg<"dpF64_8", 64, [dpI64_8]>;
def dpF64_9 : WDCDpReg<"dpF64_9", 72, [dpI64_9]>;
def dpF64_10 : WDCDpReg<"dpF64_10", 80, [dpI64_10]>;
def dpF64_11 : WDCDpReg<"dpF64_11", 88, [dpI64_11]>;
def dpF64_12 : WDCDpReg<"dpF64_12", 96, [dpI64_12]>;
def dpF64_13 : WDCDpReg<"dpF64_13", 104, [dpI64_13]>;
def dpF64_14 : WDCDpReg<"dpF64_14", 112, [dpI64_14]>;
def dpF64_15 : WDCDpReg<"dpF64_15", 120, [dpI64_15]>;
def dpF64_16 : WDCDpReg<"dpF64_16", 128, [dpI64_16]>;
def dpF64_17 : WDCDpReg<"dpF64_17", 136, [dpI64_17]>;
def dpF64_18 : WDCDpReg<"dpF64_18", 144, [dpI64_18]>;
def dpF64_19 : WDCDpReg<"dpF64_19", 152, [dpI64_19]>;
def dpF64_20 : WDCDpReg<"dpF64_20", 160, [dpI64_20]>;
def dpF64_21 : WDCDpReg<"dpF64_21", 168, [dpI64_21]>;
def dpF64_22 : WDCDpReg<"dpF64_22", 176, [dpI64_22]>;
def dpF64_23 : WDCDpReg<"dpF64_23", 184, [dpI64_23]>;
def dpF64_24 : WDCDpReg<"dpF64_24", 192, [dpI64_24]>;
def dpF64_25 : WDCDpReg<"dpF64_25", 200, [dpI64_25]>;
def dpF64_26 : WDCDpReg<"dpF64_26", 208, [dpI64_26]>;
def dpF64_27 : WDCDpReg<"dpF64_27", 216, [dpI64_27]>;
def dpF64_28 : WDCDpReg<"dpF64_28", 224, [dpI64_28]>;
def dpF64_29 : WDCDpReg<"dpF64_29", 232, [dpI64_29]>;
def dpF64_30 : WDCDpReg<"dpF64_30", 240, [dpI64_30]>;
def dpF64_31 : WDCDpReg<"dpF64_31", 248, [dpI64_31]>;
}


def IntRegs : RegisterClass<"WDC", [i16], 8,
(add A, X, Y)>;


def AccRegs : RegisterClass<"WDC", [i16], 8,
(add A)>;


def IndexRegs : RegisterClass<"WDC", [i16], 8,
(add X, Y)>;


def IndexXRegs : RegisterClass<"WDC", [i16], 8,
(add X)>;


def IndexYRegs : RegisterClass<"WDC", [i16], 8,
(add Y)>;


def DataBankRegs : RegisterClass<"WDC", [i8], 8,
(add B)>;


def DirectPageRegs : RegisterClass<"WDC", [i16], 8,
(add D)>;


def StackPointerRegs : RegisterClass<"WDC", [i16], 8,
(add S)>;


def ProcessorStatusRegs : RegisterClass<"WDC", [i8], 8,
(add P)>;


def ProgramBankRegs : RegisterClass<"WDC", [i8], 8,
(add K)>;


def Int16Regs : RegisterClass<"WDC", [i16], 8,
(add  dpI16_0,   dpI16_1,   dpI16_2,   dpI16_3,   dpI16_4,   dpI16_5,   dpI16_6,   dpI16_7,   dpI16_8,   dpI16_9,
     dpI16_10,  dpI16_11,  dpI16_12,  dpI16_13,  dpI16_14,  dpI16_15,  dpI16_16,  dpI16_17,  dpI16_18,  dpI16_19,
     dpI16_20,  dpI16_21,  dpI16_22,  dpI16_23,  dpI16_24,  dpI16_25,  dpI16_26,  dpI16_27,  dpI16_28,  dpI16_29,
     dpI16_30,  dpI16_31,  dpI16_32,  dpI16_33,  dpI16_34,  dpI16_35,  dpI16_36,  dpI16_37,  dpI16_38,  dpI16_39,
     dpI16_40,  dpI16_41,  dpI16_42,  dpI16_43,  dpI16_44,  dpI16_45,  dpI16_46,  dpI16_47,  dpI16_48,  dpI16_49,
     dpI16_50,  dpI16_51,  dpI16_52,  dpI16_53,  dpI16_54,  dpI16_55,  dpI16_56,  dpI16_57,  dpI16_58,  dpI16_59,
     dpI16_60,  dpI16_61,  dpI16_62,  dpI16_63,  dpI16_64,  dpI16_65,  dpI16_66,  dpI16_67,  dpI16_68,  dpI16_69,
     dpI16_70,  dpI16_71,  dpI16_72,  dpI16_73,  dpI16_74,  dpI16_75,  dpI16_76,  dpI16_77,  dpI16_78,  dpI16_79,
     dpI16_80,  dpI16_81,  dpI16_82,  dpI16_83,  dpI16_84,  dpI16_85,  dpI16_86,  dpI16_87,  dpI16_88,  dpI16_89,
     dpI16_90,  dpI16_91,  dpI16_92,  dpI16_93,  dpI16_94,  dpI16_95,  dpI16_96,  dpI16_97,  dpI16_98,  dpI16_99,
    dpI16_100, dpI16_101, dpI16_102, dpI16_103, dpI16_104, dpI16_105, dpI16_106, dpI16_107, dpI16_108, dpI16_109,
    dpI16_110, dpI16_111, dpI16_112, dpI16_113, dpI16_114, dpI16_115, dpI16_116, dpI16_117, dpI16_118, dpI16_119,
dpI16_120, dpI16_121, dpI16_122, dpI16_123, dpI16_124, dpI16_125, dpI16_126, dpI16_127 )>;


def Int32Regs : RegisterClass<"WDC", [i32], 8,
(add  dpI32_0,  dpI32_1,  dpI32_2,  dpI32_3,  dpI32_4,  dpI32_5,  dpI32_6,  dpI32_7,  dpI32_8,  dpI32_9,
     dpI32_10, dpI32_11, dpI32_12, dpI32_13, dpI32_14, dpI32_15, dpI32_16, dpI32_17, dpI32_18, dpI32_19,
     dpI32_20, dpI32_21, dpI32_22, dpI32_23, dpI32_24, dpI32_25, dpI32_26, dpI32_27, dpI32_28, dpI32_29,
     dpI32_30, dpI32_31, dpI32_32, dpI32_33, dpI32_34, dpI32_35, dpI32_36, dpI32_37, dpI32_38, dpI32_39,
     dpI32_40, dpI32_41, dpI32_42, dpI32_43, dpI32_44, dpI32_45, dpI32_46, dpI32_47, dpI32_48, dpI32_49,
     dpI32_50, dpI32_51, dpI32_52, dpI32_53, dpI32_54, dpI32_55, dpI32_56, dpI32_57, dpI32_58, dpI32_59,
     dpI32_60, dpI32_61, dpI32_62, dpI32_63 )>;


def Float32Regs : RegisterClass<"WDC", [f32], 8,
(add  dpF32_0,  dpF32_1,  dpF32_2,  dpF32_3,  dpF32_4,  dpF32_5,  dpF32_6,  dpF32_7,  dpF32_8,  dpF32_9,
     dpF32_10, dpF32_11, dpF32_12, dpF32_13, dpF32_14, dpF32_15, dpF32_16, dpF32_17, dpF32_18, dpF32_19,
     dpF32_20, dpF32_21, dpF32_22, dpF32_23, dpF32_24, dpF32_25, dpF32_26, dpF32_27, dpF32_28, dpF32_29,
     dpF32_30, dpF32_31, dpF32_32, dpF32_33, dpF32_34, dpF32_35, dpF32_36, dpF32_37, dpF32_38, dpF32_39,
     dpF32_40, dpF32_41, dpF32_42, dpF32_43, dpF32_44, dpF32_45, dpF32_46, dpF32_47, dpF32_48, dpF32_49,
     dpF32_50, dpF32_51, dpF32_52, dpF32_53, dpF32_54, dpF32_55, dpF32_56, dpF32_57, dpF32_58, dpF32_59,
dpF32_60, dpF32_61, dpF32_62, dpF32_63 )>;


def Int64Regs : RegisterClass<"WDC", [i64], 8,
(add  dpI64_0,  dpI64_1,  dpI64_2,  dpI64_3,  dpI64_4,  dpI64_5,  dpI64_6,  dpI64_7,  dpI64_8,  dpI64_9,
     dpI64_10, dpI64_11, dpI64_12, dpI64_13, dpI64_14, dpI64_15, dpI64_16, dpI64_17, dpI64_18, dpI64_19,
     dpI64_20, dpI64_21, dpI64_22, dpI64_23, dpI64_24, dpI64_25, dpI64_26, dpI64_27, dpI64_28, dpI64_29,
dpI64_30, dpI64_31 )>;


def Float64Regs : RegisterClass<"WDC", [f64], 8,
(add  dpF64_0,  dpF64_1,  dpF64_2,  dpF64_3,  dpF64_4,  dpF64_5,  dpF64_6,  dpF64_7,  dpF64_8,  dpF64_9,
     dpF64_10, dpF64_11, dpF64_12, dpF64_13, dpF64_14, dpF64_15, dpF64_16, dpF64_17, dpF64_18, dpF64_19,
     dpF64_20, dpF64_21, dpF64_22, dpF64_23, dpF64_24, dpF64_25, dpF64_26, dpF64_27, dpF64_28, dpF64_29,
     dpF64_30, dpF64_31 )>;