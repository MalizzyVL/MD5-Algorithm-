`define digestOutput(Aoutput, Boutput,Coutput, Doutput,AA,BB,CC,DD, digestoutput)                   \
AA <= Aoutput +'h67452301 ;                                                                    \
BB <= Boutput +'hefcdaB89 ;                                                                    \
CC <= Coutput +'h98badcfe ;                                                                    \
DD <= Doutput +'h10325476;                                                                     \
 digestoutput<={AA,BB,CC,DD};

`define digestWordShifting(WA, WD, WDR, WC, WCR, WB)          \
  WA <=WD;                                                       \
  WDR <= WC;                                                      \
  WCR <= WB;                                                     \

`define wordShifting(Wnext, Wprev) \
  Wnext[0] <= Wprev[0];         \
  Wnext[1] <= Wprev[1];         \
  Wnext[2] <= Wprev[2];         \
  Wnext[3] <= Wprev[3];         \
  Wnext[4] <= Wprev[4];         \
  Wnext[5] <= Wprev[5];         \
  Wnext[6] <= Wprev[6];         \
  Wnext[7] <= Wprev[7];         \
  Wnext[8] <= Wprev[8];         \
  Wnext[9] <= Wprev[9];         \
  Wnext[10] <= Wprev[10];       \
  Wnext[11] <= Wprev[11];       \
  Wnext[12] <= Wprev[12];       \
  Wnext[13] <= Wprev[13];       \
  Wnext[14] <= Wprev[14];       \
  Wnext[15] <= Wprev[15];       \


module Md5Core (
  input wire clk,
  input wire [511:0] wordChunk,
  input wire [31:0] A0,
  input wire [31:0] B0,
  input wire [31:0] C0,
  input wire [31:0] D0,
  output reg [31:0] A64,
  output reg [31:0] B64,
  output reg [31:0] C64,
  output reg [31:0] D64,
  output reg [127:0] digestValue);


  wire [31:0] word0 [0:15];
  assign word0[0] =  wordChunk[31:0];
  assign word0[1] =  wordChunk[63:32];
  assign word0[2] =  wordChunk[95:64];
  assign word0[3] =  wordChunk[127:96];
  assign word0[4] =  wordChunk[159:128];
  assign word0[5] =  wordChunk[191:160];
  assign word0[6] =  wordChunk[223:192];
  assign word0[7] =  wordChunk[255:224];
  assign word0[8] =  wordChunk[287:256];
  assign word0[9] =  wordChunk[319:288];
  assign word0[10] = wordChunk[351:320];
  assign word0[11] =  wordChunk[383:352];
  assign word0[12] =  wordChunk[415:384];
  assign word0[13] =  wordChunk[447:416];
  assign word0[14] =  wordChunk[479:448];
  assign word0[15] =  wordChunk[511:480];

  reg [31:0] word1 [0:15];
  reg [31:0] word2 [0:15];
  reg [31:0] word3 [0:15];
  reg [31:0] word4 [0:15];
  reg [31:0] word5 [0:15];
  reg [31:0] word6 [0:15];
  reg [31:0] word7 [0:15];
  reg [31:0] word8 [0:15];
  reg [31:0] word9 [0:15];
  reg [31:0] word10 [0:15];
  reg [31:0] word11 [0:15];
  reg [31:0] word12 [0:15];
  reg [31:0] word13 [0:15];
  reg [31:0] word14 [0:15];
  reg [31:0] word15 [0:15];
  reg [31:0] word16 [0:15];
  reg [31:0] word17 [0:15];
  reg [31:0] word18 [0:15];
  reg [31:0] word19 [0:15];
  reg [31:0] word20 [0:15];
  reg [31:0] word21 [0:15];
  reg [31:0] word22 [0:15];
  reg [31:0] word23 [0:15];
  reg [31:0] word24 [0:15];
  reg [31:0] word25 [0:15];
  reg [31:0] word26 [0:15];
  reg [31:0] word27 [0:15];
  reg [31:0] word28 [0:15];
  reg [31:0] word29 [0:15];
  reg [31:0] word30 [0:15];
  reg [31:0] word31 [0:15];
  reg [31:0] word32 [0:15];
  reg [31:0] word33 [0:15];
  reg [31:0] word34 [0:15];
  reg [31:0] word35 [0:15];
  reg [31:0] word36 [0:15];
  reg [31:0] word37 [0:15];
  reg [31:0] word38 [0:15];
  reg [31:0] word39 [0:15];
  reg [31:0] word40 [0:15];
  reg [31:0] word41 [0:15];
  reg [31:0] word42 [0:15];
  reg [31:0] word43 [0:15];
  reg [31:0] word44 [0:15];
  reg [31:0] word45 [0:15];
  reg [31:0] word46 [0:15];
  reg [31:0] word47 [0:15];
  reg [31:0] word48 [0:15];
  reg [31:0] word49 [0:15];
  reg [31:0] word50 [0:15];
  reg [31:0] word51 [0:15];
  reg [31:0] word52 [0:15];
  reg [31:0] word53 [0:15];
  reg [31:0] word54 [0:15];
  reg [31:0] word55 [0:15];
  reg [31:0] word56 [0:15];
  reg [31:0] word57 [0:15];
  reg [31:0] word58 [0:15];
  reg [31:0] word59 [0:15];
  reg [31:0] word60 [0:15];
  reg [31:0] word61 [0:15];
  reg [31:0] word62 [0:15];
  reg [31:0] word63 [0:15];

  reg  [31:0] A,B,C,D;
  reg [31:0]
  A1, B1, C1, D1,
  A2, B2, C2, D2,
  A3, B3, C3, D3,
  A4, B4, C4, D4,
  A5, B5, C5, D5,
  A6, B6, C6, D6,
  A7, B7, C7, D7,
  A8, B8, C8, D8,
  A9, B9, C9, D9,
  A10, B10, C10, D10,
  A11, B11, C11, D11,
  A12, B12, C12, D12,
  A13, B13, C13, D13,
  A14, B14, C14, D14,
  A15, B15, C15, D15,
  A16, B16, C16, D16,
  A17, B17, C17, D17,
  A18, B18, C18, D18,
  A19, B19, C19, D19,
  A20, B20, C20, D20,
  A21, B21, C21, D21,
  A22, B22, C22, D22,
  A23, B23, C23, D23,
  A24, B24, C24, D24,
  A25, B25, C25, D25,
  A26, B26, C26, D26,
  A27, B27, C27, D27,
  A28, B28, C28, D28,
  A29, B29, C29, D29,
  A30, B30, C30, D30,
  A31, B31, C31, D31,
  A32, B32, C32, D32,
  A33, B33, C33, D33,
  A34, B34, C34, D34,
  A35, B35, C35, D35,
  A36, B36, C36, D36,
  A37, B37, C37, D37,
  A38, B38, C38, D38,
  A39, B39, C39, D39,
  A40, B40, C40, D40,
  A41, B41, C41, D41,
  A42, B42, C42, D42,
  A43, B43, C43, D43,
  a44, b44, C44, D44,
  A45, B45, C45, D45,
  A46, B46, C46, d46,
  A47, B47, C47, D47,
  A48, B48, C48, D48,
  A49, B49, C49, D49,
  A50, B50, C50, D50,
  A51, B51, C51, D51,
  A52, B52, C52, D52,
  A53, B53, C53, D53,
  A54, B54, C54, D54,
  A55, B55, C55, D55,
  A56, B56, C56, D56,
  A57, B57, C57, D57,
  A58, B58, C58, D58,
  A59, B59, C59, D59,
  A60, B60, C60, D60,
  A61, B61, C61, D61,
  A62, B62, C62, D62,
  A63, B63, C63, D63;


  always @(posedge clk)
    begin
      `digestWordShifting(A1, D0, D1, C0, C1, B0)
      B1 <= B0 + ((((A0 + ((B0 & C0) | ((~B0) & D0)) + 'hd76aA478 + word0[0]) << 7) | ((A0 + ((B0 & C0) | ((~B0) & D0)) + 'hd76aA478 + word0[0]) >> (32 - 7))));
      `wordShifting(word1, word0)

      `digestWordShifting(A2, D1, D2, C1, C2, B1)
      B2 <= B1 + (((A1 + ((B1 & C1) | ((~B1) & D1)) + 'he8c7b756 + word1[1]) << 12) | ((A1 + ((B1 & C1) | ((~B1) & D1)) + 'he8c7b756 + word1[1]) >> (32 -12 )));
      `wordShifting(word2, word1)

      `digestWordShifting(A3, D2, D3, C2, C3, B2)
      B3 <= B2 + (((A2 + ((B2 & C2) | ((~B2) & D2)) + 'h242070db + word2[2]) << 17) | ((A2 + ((B2 & C2) | ((~B2) & D2)) + 'h242070db + word2[2]) >> (32-17)));
      `wordShifting(word3, word2)

      `digestWordShifting(A4, D3, D4, C3, C4, B3)
      B4 <= B3 + (((A3 + ((B3 & C3) | ((~B3) & D3)) + 'hc1bdceee + word3[3]) << 22) | ((A3 + ((B3 & C3) | ((~B3) & D3)) + 'hc1bdceee + word3[3]) >> (32-22)));
      `wordShifting(word4, word3)

      `digestWordShifting(A5, D4, D5, C4, C5, B4)
      B5 <= B4 + (((A4 + ((B4 & C4) | ((~B4) & D4)) + 'hf57c0faf + word4[4]) << 7) | ((A4 + ((B4 & C4) | ((~B4) & D4)) + 'hf57c0faf + word4[4]) >> (32-7)));
      `wordShifting(word5, word4)

      `digestWordShifting(A6, D5, D6, C5, C6, B5)
      B6 <= B5 + (((A5 + ((B5 & C5) | ((~B5) & D5)) + 'h4787c62a + word5[5]) << 12) | ((A5 + ((B5 & C5) | ((~B5) & D5)) + 'h4787c62a + word5[5]) >> (32-12)));
      `wordShifting(word6, word5)

      `digestWordShifting(A7, D6, D7, C6, C7, B6)
      B7 <= B6 + (((A6 + ((B6 & C6) | ((~B6) & D6)) + 'ha8304613 + word6[6]) << 17) | ((A6 + ((B6 & C6) | ((~B6) & D6)) + 'ha8304613 + word6[6]) >> (32 - 17)));
      `wordShifting(word7, word6)

      `digestWordShifting(A8, D7, D8, C7, C8, B7)
      B8 <= B7 + (((A7 + ((B7 & C7) | ((~B7) & D7)) + 'hfd469501 + word7[7]) << 22) | ((A7 + ((B7 & C7) | ((~B7) & D7)) + 'hfd469501 + word7[7]) >> (32 - 22)));
      `wordShifting(word8, word7)

      `digestWordShifting(A9, D8, D9, C8, C9, B8)
      B9 <= B8 + (((A8 + ((B8 & C8) | ((~B8) & D8)) + 'h698098d8 + word8[8]) << 7) | ((A8 + ((B8 & C8) | ((~B8) & D8)) + 'h698098d8 + word8[8]) >> (32 - 7)));
      `wordShifting(word9, word8)

      `digestWordShifting(A10, D9, D10, C9, C10, B9)
      B10 <= B9 + (((A9 + ((B9 & C9) | ((~B9) & D9)) + 'h8b44f7af + word9[9]) << 12) | ((A9 + ((B9 & C9) | ((~B9) & D9)) + 'h8b44f7af + word9[9]) >> (32 - 12)));
      `wordShifting(word10, word9)

      `digestWordShifting(A11, D10, D11, C10, C11, B10)
      B11 <= B10 + (((A10 + ((B10 & C10) | ((~B10) & D10)) + 'hffff5bb1 + word10[10]) << 17) | ((A10 + ((B10 & C10) | ((~B10) & D10)) + 'hffff5bb1 + word10[10]) >> (32 - 17)));
      `wordShifting(word11, word10)

      `digestWordShifting(A12, D11, D12, C11, C12, B11)
      B12 <= B11 + (((A11 + ((B11 & C11) | ((~B11) & D11)) + 'h895cd7be + word11[11]) << 22) | ((A11 + ((B11 & C11) | ((~B11) & D11)) + 'h895cd7be + word11[11]) >> (32 - 22)));
      `wordShifting(word12, word11)

      `digestWordShifting(A13, D12, D13, C12, C13, B12)
      B13 <= B12 + (((A12 + ((B12 & C12) | ((~B12) & D12)) + 'h6b901122 + word12[12]) << 7) | ((A12 + ((B12 & C12) | ((~B12) & D12)) + 'h6b901122 + word12[12]) >> (32 - 7)));
      `wordShifting(word13, word12)

      `digestWordShifting(A14, D13, D14, C13, C14, B13)
      B14 <= B13 + (((A13 + ((B13 & C13) | ((~B13) & D13)) + 'hfd987193 + word13[13]) << 12) | ((A13 + ((B13 & C13) | ((~B13) & D13)) + 'hfd987193 + word13[13]) >> (32 - 12)));
      `wordShifting(word14, word13)

      `digestWordShifting(A15, D14, D15, C14, C15, B14)
      B15 <= B14 + (((A14 + ((B14 & C14) | ((~B14) & D14)) + 'ha679438e + word14[14]) << 17) | ((A14 + ((B14 & C14) | ((~B14) & D14)) + 'ha679438e + word14[14]) >> (32 - 17)));
      `wordShifting(word15, word14)

      `digestWordShifting(A16, D15, D16, C15, C16, B15)
      B16 <= B15 + (((A15 + ((B15 & C15) | ((~B15) & D15)) + 'h49b40821 + word15[15]) << 22) | ((A15 + ((B15 & C15) | ((~B15) & D15)) + 'h49b40821 + word15[15]) >> (32 - 22)));
      `wordShifting(word16, word15)

      `digestWordShifting(A17, D16, D17, C16, C17, B16)
      B17 <= B16 + (((A16 + ((D16 & B16) | ((~D16) & C16)) + 'hf61e2562 + word16[(5 * 16 + 1) % 16]) << 5) | ((A16 + ((D16 & B16) | ((~D16) & C16)) + 'hf61e2562 + word16[(5 * 16 + 1) % 16]) >> (32 - 5)));
      `wordShifting(word17, word16)

      `digestWordShifting(A18, D17, D18, C17, C18, B17)
      B18 <= B17 + (((A17 + ((D17 & B17) | ((~D17) & C17)) + 'hc040B340 + word17[(5 * 17 + 1) % 16]) << 9) | ((A17 + ((D17 & B17) | ((~D17) & C17)) + 'hc040B340 + word17[(5 * 17 + 1) % 16]) >> (32 - 9)));
      `wordShifting(word18, word17)

      `digestWordShifting(A19, D18, D19, C18, C19, B18)
      B19 <= B18 + (((A18 + ((D18 & B18) | ((~D18) & C18)) + 'h265e5a51 + word18[(5 * 18 + 1) % 16]) << 14) | ((A18 + ((D18 & B18) | ((~D18) & C18)) + 'h265e5a51 + word18[(5 * 18 + 1) % 16]) >> (32 - 14)));
      `wordShifting(word19, word18)

      `digestWordShifting(A20, D19, D20, C19, C20, B19)
      B20 <= B19 + (((A19 + ((D19 & B19) | ((~D19) & C19)) + 'he9b6c7aa + word19[(5 * 19 + 1) % 16]) << 20) | ((A19 + ((D19 & B19) | ((~D19) & C19)) + 'he9b6c7aa + word19[(5 * 19 + 1) % 16]) >> (32 - 20)));
      `wordShifting(word20, word19)

      `digestWordShifting(A21, D20, D21, C20, C21, B20)
      B21 <= B20 + (((A20 + ((D20 & B20) | ((~D20) & C20)) + 'hd62f105d + word20[(5 * 20 + 1) % 16]) << 5) | ((A20 + ((D20 & B20) | ((~D20) & C20)) + 'hd62f105d + word20[(5 * 20 + 1) % 16]) >> (32 - 5)));
      `wordShifting(word21, word20)

      `digestWordShifting(A22, D21, D22, C21, C22, B21)
      B22 <= B21 + (((A21 + ((D21 & B21) | ((~D21) & C21)) + 'h02441453 + word21[(5 * 21 + 1) % 16]) << 9) | ((A21 + ((D21 & B21) | ((~D21) & C21)) + 'h02441453 + word21[(5 * 21 + 1) % 16]) >> (32 - 9)));
      `wordShifting(word22, word21)

      `digestWordShifting(A23, D22, D23, C22, C23, B22)
      B23 <= B22 + (((A22 + ((D22 & B22) | ((~D22) & C22)) + 'hd8a1e681 + word22[(5 * 22 + 1) % 16]) << 14) | ((A22 + ((D22 & B22) | ((~D22) & C22)) + 'hd8a1e681 + word22[(5 * 22 + 1) % 16]) >> (32 - 14)));
      `wordShifting(word23, word22)

      `digestWordShifting(A24, D23, D24, C23, C24, B23)
      B24 <= B23 + (((A23 + ((D23 & B23) | ((~D23) & C23)) + 'he7d3fbc8 + word23[(5 * 23 + 1) % 16]) << 20) | ((A23 + ((D23 & B23) | ((~D23) & C23)) + 'he7d3fbc8 + word23[(5 * 23 + 1) % 16]) >> (32 - 20)));
      `wordShifting(word24, word23)

      `digestWordShifting(A25, D24, D25, C24, C25, B24)
      B25 <= B24 + (((A24 + ((D24 & B24) | ((~D24) & C24)) + 'h21e1cde6 + word24[(5 * 24 + 1) % 16]) << 5) | ((A24 + ((D24 & B24) | ((~D24) & C24)) + 'h21e1cde6 + word24[(5 * 24 + 1) % 16]) >> (32 - 5)));
      `wordShifting(word25, word24)

      `digestWordShifting(A26, D25, D26, C25, C26, B25)
      B26 <= B25 + (((A25 + ((D25 & B25) | ((~D25) & C25)) + 'hc33707d6 + word25[(5 * 25 + 1) % 16]) << 9) | ((A25 + ((D25 & B25) | ((~D25) & C25)) + 'hc33707d6 + word25[(5 * 25 + 1) % 16]) >> (32 - 9)));
      `wordShifting(word26, word25)

      `digestWordShifting(A27, D26, D27, C26, C27, B26)
      B27 <= B26 + (((A26 + ((D26 & B26) | ((~D26) & C26)) + 'hf4d50d87 + word26[(5 * 26 + 1) % 16]) << 14) | ((A26 + ((D26 & B26) | ((~D26) & C26)) + 'hf4d50d87 + word26[(5 * 26 + 1) % 16]) >> (32 - 14)));
      `wordShifting(word27, word26)

      `digestWordShifting(A28, D27, D28, C27, C28, B27)
      B28 <= B27 + (((A27 + ((D27 & B27) | ((~D27) & C27)) + 'h455a14ed + word27[(5 * 27 + 1) % 16]) << 20) | ((A27 + ((D27 & B27) | ((~D27) & C27)) + 'h455a14ed + word27[(5 * 27 + 1) % 16]) >> (32 - 20)));
      `wordShifting(word28, word27)

      `digestWordShifting(A29, D28, D29, C28, C29, B28)
      B29 <= B28 + (((A28 + ((D28 & B28) | ((~D28) & C28)) + 'ha9e3e905 + word28[(5 * 28 + 1) % 16]) << 5) | ((A28 + ((D28 & B28) | ((~D28) & C28)) + 'ha9e3e905 + word28[(5 * 28 + 1) % 16]) >> (32 - 5)));
      `wordShifting(word29, word28)

      `digestWordShifting(A30, D29, D30, C29, C30, B29)
      B30 <= B29 + (((A29 + ((D29 & B29) | ((~D29) & C29)) + 'hfcefa3f8 + word29[(5 * 29 + 1) % 16]) << 9) | ((A29 + ((D29 & B29) | ((~D29) & C29)) + 'hfcefa3f8 + word29[(5 * 29 + 1) % 16]) >> (32 - 9)));
      `wordShifting(word30, word29)

      `digestWordShifting(A31, D30, D31, C30, C31, B30)
      B31 <= B30 + (((A30 + ((D30 & B30) | ((~D30) & C30)) + 'h676f02d9 + word30[(5 * 30 + 1) % 16]) << 14) | ((A30 + ((D30 & B30) | ((~D30) & C30)) + 'h676f02d9 + word30[(5 * 30 + 1) % 16]) >> (32 - 14)));
      `wordShifting(word31, word30)

      `digestWordShifting(A32, D31, D32, C31, C32, B31)
      B32 <= B31 + (((A31 + ((D31 & B31) | ((~D31) & C31)) + 'hbd2A4c8a + word31[(5 * 31 + 1) % 16]) << 20) | ((A31 + ((D31 & B31) | ((~D31) & C31)) + 'hbd2A4c8a + word31[(5 * 31 + 1) % 16]) >> (32 - 20)));
      `wordShifting(word32, word31)

      `digestWordShifting(A33, D32, D33, C32, C33, B32)
      B33 <= B32 + (((A32 + (B32 ^ C32 ^ D32) + 'hfffa3942 + word32[(3 * 32 + 5) % 16]) << 4) | ((A32 + (B32 ^ C32 ^ D32) + 'hfffa3942 + word32[(3 * 32 + 5) % 16]) >> (32 - 4)));
      `wordShifting(word33, word32)

      `digestWordShifting(A34, D33, D34, C33, C34, B33)
      B34 <= B33 + (((A33 + (B33 ^ C33 ^ D33) + 'h8771f681 + word33[(3 * 33 + 5) % 16]) << 11) | ((A33 + (B33 ^ C33 ^ D33) + 'h8771f681 + word33[(3 * 33 + 5) % 16]) >> (32 - 11)));
      `wordShifting(word34, word33)

      `digestWordShifting(A35, D34, D35, C34, C35, B34)
      B35 <= B34 + (((A34 + (B34 ^ C34 ^ D34) + 'h6d9d6122 + word34[(3 * 34 + 5) % 16]) << 16) | ((A34 + (B34 ^ C34 ^ D34) + 'h6d9d6122 + word34[(3 * 34 + 5) % 16]) >> (32 - 16)));
      `wordShifting(word35, word34)

      `digestWordShifting(A36, D35, D36, C35, C36, B35)
      B36 <= B35 + (((A35 + (B35 ^ C35 ^ D35) + 'hfde5380c + word35[(3 * 35 + 5) % 16]) << 23) | ((A35 + (B35 ^ C35 ^ D35) + 'hfde5380c + word35[(3 * 35 + 5) % 16]) >> (32 - 23)));
      `wordShifting(word36, word35)

      `digestWordShifting(A37, D36, D37, C36, C37, B36)
      B37 <= B36 + (((A36 + (B36 ^ C36 ^ D36) + 'ha4beea44 + word36[(3 * 36 + 5) % 16]) << 4) | ((A36 + (B36 ^ C36 ^ D36) + 'ha4beea44 + word36[(3 * 36 + 5) % 16]) >> (32 - 4)));
      `wordShifting(word37, word36)

      `digestWordShifting(A38, D37, D38, C37, C38, B37)
      B38 <= B37 + (((A37 + (B37 ^ C37 ^ D37) + 'h4bdecfa9 + word37[(3 * 37 + 5) % 16]) << 11) | ((A37 + (B37 ^ C37 ^ D37) + 'h4bdecfa9 + word37[(3 * 37 + 5) % 16]) >> (32 - 11)));
      `wordShifting(word38, word37)

      `digestWordShifting(A39, D38, D39, C38, C39, B38)
      B39 <= B38 + (((A38 + (B38 ^ C38 ^ D38) + 'hf6bb4b60 + word38[(3 * 38 + 5) % 16]) << 16) | ((A38 + (B38 ^ C38 ^ D38) + 'hf6bb4b60 + word38[(3 * 38 + 5) % 16]) >> (32 - 16)));
      `wordShifting(word39, word38)

      `digestWordShifting(A40, D39, D40, C39, C40, B39)
      B40 <= B39 + (((A39 + (B39 ^ C39 ^ D39) + 'hbebfbc70 + word39[(3 * 39 + 5) % 16]) << 23) | ((A39 + (B39 ^ C39 ^ D39) + 'hbebfbc70 + word39[(3 * 39 + 5) % 16]) >> (32 - 23)));
      `wordShifting(word40, word39)

      `digestWordShifting(A41, D40, D41, C40, C41, B40)
      B41 <= B40 + (((A40 + (B40 ^ C40 ^ D40) + 'h289b7ec6 + word40[(3 * 40 + 5) % 16]) << 4) | ((A40 + (B40 ^ C40 ^ D40) + 'h289b7ec6 + word40[(3 * 40 + 5) % 16]) >> (32 - 4)));
      `wordShifting(word41, word40)

      `digestWordShifting(A42, D41, D42, C41, C42, B41)
      B42 <= B41 + (((A41 + (B41 ^ C41 ^ D41) + 'heaa127fa + word41[(3 * 41 + 5) % 16]) << 11) | ((A41 + (B41 ^ C41 ^ D41) + 'heaa127fa + word41[(3 * 41 + 5) % 16]) >> (32 - 11)));
      `wordShifting(word42, word41)

      `digestWordShifting(A43, D42, D43, C42, C43, B42)
      B43 <= B42 + (((A42 + (B42 ^ C42 ^ D42) + 'hd4ef3085 + word42[(3 * 42 + 5) % 16]) << 16) | ((A42 + (B42 ^ C42 ^ D42) + 'hd4ef3085 + word42[(3 * 42 + 5) % 16]) >> (32 - 16)));
      `wordShifting(word43, word42)

      `digestWordShifting(a44, D43, D44, C43, C44, B43)
      b44 <= B43 + (((A43 + (B43 ^ C43 ^ D43) + 'h04881d05 + word43[(3 * 43 + 5) % 16]) << 23) | ((A43 + (B43 ^ C43 ^ D43) + 'h04881d05 + word43[(3 * 43 + 5) % 16]) >> (32 - 23)));
      `wordShifting(word44, word43)

      `digestWordShifting(A45, D44, D45, C44, C45, b44)
      B45 <= b44 + (((a44 + (b44 ^ C44 ^ D44) + 'hd9d4d039 + word44[(3 * 44 + 5) % 16]) << 4) | ((a44 + (b44 ^ C44 ^ D44) + 'hd9d4d039 + word44[(3 * 44 + 5) % 16]) >> (32 - 4)));
      `wordShifting(word45, word44)

      `digestWordShifting(A46, D45, d46, C45, C46, B45)
      B46 <= B45 + (((A45 + (B45 ^ C45 ^ D45) + 'he6db99e5 + word45[(3 * 45 + 5) % 16]) << 11) | ((A45 + (B45 ^ C45 ^ D45) + 'he6db99e5 + word45[(3 * 45 + 5) % 16]) >> (32 - 11)));
      `wordShifting(word46, word45)

      `digestWordShifting(A47, d46, D47, C46, C47, B46)
      B47 <= B46 + (((A46 + (B46 ^ C46 ^ d46) + 'h1fa27cf8 + word46[(3 * 46 + 5) % 16]) << 16) | ((A46 + (B46 ^ C46 ^ d46) + 'h1fa27cf8 + word46[(3 * 46 + 5) % 16]) >> (32 - 16)));
      `wordShifting(word47, word46)

      `digestWordShifting(A48, D47, D48, C47, C48, B47)
      B48 <= B47 + (((A47 + (B47 ^ C47 ^ D47) + 'hc4ac5665 + word47[(3 * 47 + 5) % 16]) << 23) | ((A47 + (B47 ^ C47 ^ D47) + 'hc4ac5665 + word47[(3 * 47 + 5) % 16]) >> (32 - 23)));
      `wordShifting(word48, word47)

      `digestWordShifting(A49, D48, D49, C48, C49, B48)
      B49 <= B48 + (((A48 + (C48 ^ (B48 | (~D48))) + 'hf4292244 + word48[(7 * 48) % 16]) << 6) | ((A48 + (C48 ^ (B48 | (~D48))) + 'hf4292244 + word48[(7 * 48) % 16]) >> (32 - 6)));
      `wordShifting(word49, word48)

      `digestWordShifting(A50, D49, D50, C49, C50, B49)
      B50 <= B49 + (((A49 + (C49 ^ (B49 | (~D49))) + 'h432aff97 + word49[(7 * 49) % 16]) << 10) | ((A49 + (C49 ^ (B49 | (~D49))) + 'h432aff97 + word49[(7 * 49) % 16]) >> (32 - 10)));
      `wordShifting(word50, word49)

      `digestWordShifting(A51, D50, D51, C50, C51, B50)
      B51 <= B50 + (((A50 + (C50 ^ (B50 | (~D50))) + 'hab9423A7 + word50[(7 * 50) % 16]) << 15) | ((A50 + (C50 ^ (B50 | (~D50))) + 'hab9423A7 + word50[(7 * 50) % 16]) >> (32 - 15)));
      `wordShifting(word51, word50)

      `digestWordShifting(A52, D51, D52, C51, C52, B51)
      B52 <= B51 + (((A51 + (C51 ^ (B51 | (~D51))) + 'hfc93A039 + word51[(7 * 51) % 16]) << 21) | ((A51 + (C51 ^ (B51 | (~D51))) + 'hfc93A039 + word51[(7 * 51) % 16]) >> (32 - 21)));
      `wordShifting(word52, word51)

      `digestWordShifting(A53, D52, D53, C52, C53, B52)
      B53 <= B52 + (((A52 + (C52 ^ (B52 | (~D52))) + 'h655b59c3 + word52[(7 * 52) % 16]) << 6) | ((A52 + (C52 ^ (B52 | (~D52))) + 'h655b59c3 + word52[(7 * 52) % 16]) >> (32 - 6)));
      `wordShifting(word53, word52)

      `digestWordShifting(A54, D53, D54, C53, C54, B53)
      B54 <= B53 + (((A53 + (C53 ^ (B53 | (~D53))) + 'h8f0ccC92 + word53[(7 * 53) % 16]) << 10) | ((A53 + (C53 ^ (B53 | (~D53))) + 'h8f0ccC92 + word53[(7 * 53) % 16]) >> (32 - 10)));
      `wordShifting(word54, word53)

      `digestWordShifting(A55, D54, D55, C54, C55, B54)
      B55 <= B54 + (((A54 + (C54 ^ (B54 | (~D54))) + 'hffeff47d + word54[(7 * 54) % 16]) << 15) | ((A54 + (C54 ^ (B54 | (~D54))) + 'hffeff47d + word54[(7 * 54) % 16]) >> (32 - 15)));
      `wordShifting(word55, word54)

      `digestWordShifting(A56, D55, D56, C55, C56, B55)
      B56 <= B55 + (((A55 + (C55 ^ (B55 | (~D55))) + 'h85845dd1 + word55[(7 * 55) % 16]) << 21) | ((A55 + (C55 ^ (B55 | (~D55))) + 'h85845dd1 + word55[(7 * 55) % 16]) >> (32 - 21)));
      `wordShifting(word56, word55)

      `digestWordShifting(A57, D56, D57, C56, C57, B56)
      B57 <= B56 + (((A56 + (C56 ^ (B56 | (~D56))) + 'h6fa87e4f + word56[(7 * 56) % 16]) << 6) | ((A56 + (C56 ^ (B56 | (~D56))) + 'h6fa87e4f + word56[(7 * 56) % 16]) >> (32 - 6)));
      `wordShifting(word57, word56)

      `digestWordShifting(A58, D57, D58, C57, C58, B57)
      B58 <= B57 + (((A57 + (C57 ^ (B57 | (~D57))) + 'hfe2ce6e0 + word57[(7 * 57) % 16]) << 10) | ((A57 + (C57 ^ (B57 | (~D57))) + 'hfe2ce6e0 + word57[(7 * 57) % 16]) >> (32 - 10)));
      `wordShifting(word58, word57)

      `digestWordShifting(A59, D58, D59, C58, C59, B58)
      B59 <= B58 + (((A58 + (C58 ^ (B58 | (~D58))) + 'ha3014314 + word58[(7 * 58) % 16]) << 15) | ((A58 + (C58 ^ (B58 | (~D58))) + 'ha3014314 + word58[(7 * 58) % 16]) >> (32 - 15)));
      `wordShifting(word59, word58)

      `digestWordShifting(A60, D59, D60, C59, C60, B59)
      B60 <= B59 + (((A59 + (C59 ^ (B59 | (~D59))) + 'h4e0811A1 + word59[(7 * 59) % 16]) << 21) | ((A59 + (C59 ^ (B59 | (~D59))) + 'h4e0811A1 + word59[(7 * 59) % 16]) >> (32 - 21)));
      `wordShifting(word60, word59)

      `digestWordShifting(A61, D60, D61, C60, C61, B60)
      B61 <= B60 + (((A60 + (C60 ^ (B60 | (~D60))) + 'hf7537e82 + word60[(7 * 60) % 16]) << 6) | ((A60 + (C60 ^ (B60 | (~D60))) + 'hf7537e82 + word60[(7 * 60) % 16]) >> (32 - 6)));
      `wordShifting(word61, word60)

      `digestWordShifting(A62, D61, D62, C61, C62, B61)
      B62 <= B61 + (((A61 + (C61 ^ (B61 | (~D61))) + 'hbd3af235 + word61[(7 * 61) % 16]) << 10) | ((A61 + (C61 ^ (B61 | (~D61))) + 'hbd3af235 + word61[(7 * 61) % 16]) >> (32 - 10)));
      `wordShifting(word62, word61)

      `digestWordShifting(A63, D62, D63, C62, C63, B62)
      B63 <= B62 + (((A62 + (C62 ^ (B62 | (~D62))) + 'h2ad7d2bb + word62[(7 * 62) % 16]) << 15) | ((A62 + (C62 ^ (B62 | (~D62))) + 'h2ad7d2bb + word62[(7 * 62) % 16]) >> (32 - 15)));
      `wordShifting(word63, word62)

      `digestWordShifting(A64, D63, D64, C63, C64, B63)
      B64 <= B63 + (((A63 + (C63 ^ (B63 | (~D63))) + 'heb86d391 + word63[(7 * 63) % 16]) << 21) | ((A63 + (C63 ^ (B63 | (~D63))) + 'heB86D391 + word63[(7 * 63) % 16]) >> (32 - 21)));

      `digestOutput(A64,B64,C64,D64,A,B,C,D,digestValue)
    end
endmodule
