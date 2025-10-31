module alarme (
 input A,
 input B,
 input C,
 output Y
);

 wire AB, AC, BC;
 assign AB = A & B;
 assign AC = A & C;
 assign BC = B & C;
 assign Y = AB | AC | BC;
endmodule

