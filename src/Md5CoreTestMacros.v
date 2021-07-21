
`define Stages 65

`define TestCase(number, passed, at, bt, ct, dt, chunkt)                           \
reg passed;                                                                                \
always @(posedge clk)                                                                       \
  begin                                                                                     \
    if (count == number)                                                                  \
      begin                                                                                 \
        chunk <= chunkt;                                                                   \
      end                                                                                   \
                                                                                            \
    if (count == number + 65)                                                        \
      begin                                                                                 \
      passed <=                                                                           \
        a + 'h67452301 == at &&                                                            \
        b + 'hefcdab89 == bt &&                                                            \
        c + 'h98badcfe == ct &&                                                            \
        d + 'h10325476 == dt;                                                              \
      end                                                                                   \
  end                                                                                       \
