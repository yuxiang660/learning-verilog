module muxtwo(out, a, b, sl);
    input a, b, sl;
    output out;
    wire nsl, sela, selb;
        assign nsl = ~sl;
        assign sela = a & nsl;
        assign selb = b & sl;
        assign out = sela | selb;
endmodule