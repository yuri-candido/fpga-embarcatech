module tb_somador_subtrator;

    logic M, A, B, Te;
    logic S, Ts;

    somador_subtrator uut (
        .M(M),
        .A(A),
        .B(B),
        .Te(Te),
        .S(S),
        .Ts(Ts)
    );

    initial begin
        $display("M A B Te | S Ts");
        $display("---------------");

        for (int i = 0; i < 16; i++) begin
            {M, A, B, Te} = i;  
            #50;                 
          
            $display("%b %b %b  %b | %b  %b", M, A, B, Te, S, Ts);
        end

        $finish;
    end

    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_somador_subtrator);
    end

endmodule