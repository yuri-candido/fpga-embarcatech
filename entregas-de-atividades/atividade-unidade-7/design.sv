module somador_subtrator(
    input logic M,    
    input logic A,    
    input logic B,   
    input logic Te,   
    output logic S,   
    output logic Ts   
);

    logic B_xor_M; 

    assign B_xor_M = B ^ M;

    assign S = A ^ B_xor_M ^ Te;
    assign Ts = (A & B_xor_M) | (A & Te) | (B_xor_M & Te);

endmodule