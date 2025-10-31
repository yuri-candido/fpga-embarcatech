`timescale 1ns/1ps

module subtratorcompleto_tb;
    reg a, b, cin;
    wire s, cout;

    // Instancia o DUT (Device Under Test)
    subtratorcompleto uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Arquivo de saída para GTKWave
        $dumpfile("dump.vcd");
        $dumpvars(0, subtratorcompleto_tb);

        // Monitorar sinais no terminal
        $monitor("t=%0t | a=%b b=%b cin=%b -> s=%b cout=%b", $time, a, b, cin, s, cout);

        // Testa todas as combinações (0 a 7)
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
    end
endmodule
