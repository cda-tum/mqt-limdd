// This circuit is a randomly generated Hamming Weight-controlled circuit. The control and target registers have 12 qubits each

OPENQASM 2.0;
include "qelib1.inc";
qreg q[038];

// Step 1: put the first register in uniform superposition, by applying hadamard to all qubits
h q[37];
h q[36];
h q[35];
h q[34];
h q[33];
h q[32];
h q[31];
h q[30];
h q[29];
h q[28];
h q[27];
h q[26];
// Stage 1 of Hamming control gates
// Stage 1: compute part  (12 qubits)
x q[37];
x q[36];
ccx q[37], q[36], q[25];
x q[37];
x q[36];
x q[37];
ccx q[37], q[36], q[24];
x q[37];
x q[36];
ccx q[37], q[36], q[24];
x q[36];
ccx q[37], q[36], q[23];
// Stage 2 of Hamming control gates
// Stage 2: compute part  (12 qubits)
x q[35];
ccx q[35], q[25], q[12];
x q[35];
ccx q[35], q[25], q[11];
x q[35];
ccx q[35], q[24], q[11];
x q[35];
ccx q[35], q[24], q[10];
x q[35];
ccx q[35], q[23], q[10];
x q[35];
ccx q[35], q[23], q[9];
// Stage 2: uncompute part  (n=12 qubits)
x q[37];
x q[36];
ccx q[37], q[36], q[25];
x q[37];
x q[36];
x q[37];
ccx q[37], q[36], q[24];
x q[37];
x q[36];
ccx q[37], q[36], q[24];
x q[36];
ccx q[37], q[36], q[23];
// Stage 2: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
// Stage 3 of Hamming control gates
// Stage 3: compute part  (12 qubits)
x q[34];
ccx q[34], q[25], q[12];
x q[34];
ccx q[34], q[25], q[11];
x q[34];
ccx q[34], q[24], q[11];
x q[34];
ccx q[34], q[24], q[10];
x q[34];
ccx q[34], q[23], q[10];
x q[34];
ccx q[34], q[23], q[9];
x q[34];
ccx q[34], q[22], q[9];
x q[34];
ccx q[34], q[22], q[8];
// Stage 3: uncompute part  (12 qubits)
cx q[12], q[25];
x q[34];
ccx q[34], q[11], q[24];
x q[34];
ccx q[34], q[11], q[23];
x q[34];
ccx q[34], q[10], q[23];
x q[34];
ccx q[34], q[10], q[22];
x q[34];
ccx q[34], q[9], q[22];
x q[34];
ccx q[34], q[9], q[21];
ccx q[34], q[8], q[22];
// Stage 3: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
// Stage 4 of Hamming control gates
// Stage 4: compute part  (12 qubits)
x q[33];
ccx q[33], q[25], q[12];
x q[33];
ccx q[33], q[25], q[11];
x q[33];
ccx q[33], q[24], q[11];
x q[33];
ccx q[33], q[24], q[10];
x q[33];
ccx q[33], q[23], q[10];
x q[33];
ccx q[33], q[23], q[9];
x q[33];
ccx q[33], q[22], q[9];
x q[33];
ccx q[33], q[22], q[8];
x q[33];
ccx q[33], q[21], q[8];
x q[33];
ccx q[33], q[21], q[7];
// Stage 4: uncompute part  (12 qubits)
cx q[12], q[25];
x q[33];
ccx q[33], q[11], q[24];
x q[33];
ccx q[33], q[11], q[23];
x q[33];
ccx q[33], q[10], q[23];
x q[33];
ccx q[33], q[10], q[22];
x q[33];
ccx q[33], q[9], q[22];
x q[33];
ccx q[33], q[9], q[21];
x q[33];
ccx q[33], q[8], q[21];
x q[33];
ccx q[33], q[8], q[20];
ccx q[33], q[7], q[21];
// Stage 4: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
// Stage 5 of Hamming control gates
// Stage 5: compute part  (12 qubits)
x q[32];
ccx q[32], q[25], q[12];
x q[32];
ccx q[32], q[25], q[11];
x q[32];
ccx q[32], q[24], q[11];
x q[32];
ccx q[32], q[24], q[10];
x q[32];
ccx q[32], q[23], q[10];
x q[32];
ccx q[32], q[23], q[9];
x q[32];
ccx q[32], q[22], q[9];
x q[32];
ccx q[32], q[22], q[8];
x q[32];
ccx q[32], q[21], q[8];
x q[32];
ccx q[32], q[21], q[7];
x q[32];
ccx q[32], q[20], q[7];
x q[32];
ccx q[32], q[20], q[6];
// Stage 5: uncompute part  (12 qubits)
cx q[12], q[25];
x q[32];
ccx q[32], q[11], q[24];
x q[32];
ccx q[32], q[11], q[23];
x q[32];
ccx q[32], q[10], q[23];
x q[32];
ccx q[32], q[10], q[22];
x q[32];
ccx q[32], q[9], q[22];
x q[32];
ccx q[32], q[9], q[21];
x q[32];
ccx q[32], q[8], q[21];
x q[32];
ccx q[32], q[8], q[20];
x q[32];
ccx q[32], q[7], q[20];
x q[32];
ccx q[32], q[7], q[19];
ccx q[32], q[6], q[20];
// Stage 5: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
// Stage 6 of Hamming control gates
// Stage 6: compute part  (12 qubits)
x q[31];
ccx q[31], q[25], q[12];
x q[31];
ccx q[31], q[25], q[11];
x q[31];
ccx q[31], q[24], q[11];
x q[31];
ccx q[31], q[24], q[10];
x q[31];
ccx q[31], q[23], q[10];
x q[31];
ccx q[31], q[23], q[9];
x q[31];
ccx q[31], q[22], q[9];
x q[31];
ccx q[31], q[22], q[8];
x q[31];
ccx q[31], q[21], q[8];
x q[31];
ccx q[31], q[21], q[7];
x q[31];
ccx q[31], q[20], q[7];
x q[31];
ccx q[31], q[20], q[6];
x q[31];
ccx q[31], q[19], q[6];
x q[31];
ccx q[31], q[19], q[5];
// Stage 6: uncompute part  (12 qubits)
cx q[12], q[25];
x q[31];
ccx q[31], q[11], q[24];
x q[31];
ccx q[31], q[11], q[23];
x q[31];
ccx q[31], q[10], q[23];
x q[31];
ccx q[31], q[10], q[22];
x q[31];
ccx q[31], q[9], q[22];
x q[31];
ccx q[31], q[9], q[21];
x q[31];
ccx q[31], q[8], q[21];
x q[31];
ccx q[31], q[8], q[20];
x q[31];
ccx q[31], q[7], q[20];
x q[31];
ccx q[31], q[7], q[19];
x q[31];
ccx q[31], q[6], q[19];
x q[31];
ccx q[31], q[6], q[18];
ccx q[31], q[5], q[19];
// Stage 6: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
//swap q[18],q[5];
cx q[18],q[5];
cx q[5],q[18];
cx q[18],q[5];
// Stage 7 of Hamming control gates
// Stage 7: compute part  (12 qubits)
x q[30];
ccx q[30], q[25], q[12];
x q[30];
ccx q[30], q[25], q[11];
x q[30];
ccx q[30], q[24], q[11];
x q[30];
ccx q[30], q[24], q[10];
x q[30];
ccx q[30], q[23], q[10];
x q[30];
ccx q[30], q[23], q[9];
x q[30];
ccx q[30], q[22], q[9];
x q[30];
ccx q[30], q[22], q[8];
x q[30];
ccx q[30], q[21], q[8];
x q[30];
ccx q[30], q[21], q[7];
x q[30];
ccx q[30], q[20], q[7];
x q[30];
ccx q[30], q[20], q[6];
x q[30];
ccx q[30], q[19], q[6];
x q[30];
ccx q[30], q[19], q[5];
x q[30];
ccx q[30], q[18], q[5];
x q[30];
ccx q[30], q[18], q[4];
// Stage 7: uncompute part  (12 qubits)
cx q[12], q[25];
x q[30];
ccx q[30], q[11], q[24];
x q[30];
ccx q[30], q[11], q[23];
x q[30];
ccx q[30], q[10], q[23];
x q[30];
ccx q[30], q[10], q[22];
x q[30];
ccx q[30], q[9], q[22];
x q[30];
ccx q[30], q[9], q[21];
x q[30];
ccx q[30], q[8], q[21];
x q[30];
ccx q[30], q[8], q[20];
x q[30];
ccx q[30], q[7], q[20];
x q[30];
ccx q[30], q[7], q[19];
x q[30];
ccx q[30], q[6], q[19];
x q[30];
ccx q[30], q[6], q[18];
x q[30];
ccx q[30], q[5], q[18];
x q[30];
ccx q[30], q[5], q[17];
ccx q[30], q[4], q[18];
// Stage 7: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
//swap q[18],q[5];
cx q[18],q[5];
cx q[5],q[18];
cx q[18],q[5];
//swap q[17],q[4];
cx q[17],q[4];
cx q[4],q[17];
cx q[17],q[4];
// Stage 8 of Hamming control gates
// Stage 8: compute part  (12 qubits)
x q[29];
ccx q[29], q[25], q[12];
x q[29];
ccx q[29], q[25], q[11];
x q[29];
ccx q[29], q[24], q[11];
x q[29];
ccx q[29], q[24], q[10];
x q[29];
ccx q[29], q[23], q[10];
x q[29];
ccx q[29], q[23], q[9];
x q[29];
ccx q[29], q[22], q[9];
x q[29];
ccx q[29], q[22], q[8];
x q[29];
ccx q[29], q[21], q[8];
x q[29];
ccx q[29], q[21], q[7];
x q[29];
ccx q[29], q[20], q[7];
x q[29];
ccx q[29], q[20], q[6];
x q[29];
ccx q[29], q[19], q[6];
x q[29];
ccx q[29], q[19], q[5];
x q[29];
ccx q[29], q[18], q[5];
x q[29];
ccx q[29], q[18], q[4];
x q[29];
ccx q[29], q[17], q[4];
x q[29];
ccx q[29], q[17], q[3];
// Stage 8: uncompute part  (12 qubits)
cx q[12], q[25];
x q[29];
ccx q[29], q[11], q[24];
x q[29];
ccx q[29], q[11], q[23];
x q[29];
ccx q[29], q[10], q[23];
x q[29];
ccx q[29], q[10], q[22];
x q[29];
ccx q[29], q[9], q[22];
x q[29];
ccx q[29], q[9], q[21];
x q[29];
ccx q[29], q[8], q[21];
x q[29];
ccx q[29], q[8], q[20];
x q[29];
ccx q[29], q[7], q[20];
x q[29];
ccx q[29], q[7], q[19];
x q[29];
ccx q[29], q[6], q[19];
x q[29];
ccx q[29], q[6], q[18];
x q[29];
ccx q[29], q[5], q[18];
x q[29];
ccx q[29], q[5], q[17];
x q[29];
ccx q[29], q[4], q[17];
x q[29];
ccx q[29], q[4], q[16];
ccx q[29], q[3], q[17];
// Stage 8: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
//swap q[18],q[5];
cx q[18],q[5];
cx q[5],q[18];
cx q[18],q[5];
//swap q[17],q[4];
cx q[17],q[4];
cx q[4],q[17];
cx q[17],q[4];
//swap q[16],q[3];
cx q[16],q[3];
cx q[3],q[16];
cx q[16],q[3];
// Stage 9 of Hamming control gates
// Stage 9: compute part  (12 qubits)
x q[28];
ccx q[28], q[25], q[12];
x q[28];
ccx q[28], q[25], q[11];
x q[28];
ccx q[28], q[24], q[11];
x q[28];
ccx q[28], q[24], q[10];
x q[28];
ccx q[28], q[23], q[10];
x q[28];
ccx q[28], q[23], q[9];
x q[28];
ccx q[28], q[22], q[9];
x q[28];
ccx q[28], q[22], q[8];
x q[28];
ccx q[28], q[21], q[8];
x q[28];
ccx q[28], q[21], q[7];
x q[28];
ccx q[28], q[20], q[7];
x q[28];
ccx q[28], q[20], q[6];
x q[28];
ccx q[28], q[19], q[6];
x q[28];
ccx q[28], q[19], q[5];
x q[28];
ccx q[28], q[18], q[5];
x q[28];
ccx q[28], q[18], q[4];
x q[28];
ccx q[28], q[17], q[4];
x q[28];
ccx q[28], q[17], q[3];
x q[28];
ccx q[28], q[16], q[3];
x q[28];
ccx q[28], q[16], q[2];
// Stage 9: uncompute part  (12 qubits)
cx q[12], q[25];
x q[28];
ccx q[28], q[11], q[24];
x q[28];
ccx q[28], q[11], q[23];
x q[28];
ccx q[28], q[10], q[23];
x q[28];
ccx q[28], q[10], q[22];
x q[28];
ccx q[28], q[9], q[22];
x q[28];
ccx q[28], q[9], q[21];
x q[28];
ccx q[28], q[8], q[21];
x q[28];
ccx q[28], q[8], q[20];
x q[28];
ccx q[28], q[7], q[20];
x q[28];
ccx q[28], q[7], q[19];
x q[28];
ccx q[28], q[6], q[19];
x q[28];
ccx q[28], q[6], q[18];
x q[28];
ccx q[28], q[5], q[18];
x q[28];
ccx q[28], q[5], q[17];
x q[28];
ccx q[28], q[4], q[17];
x q[28];
ccx q[28], q[4], q[16];
x q[28];
ccx q[28], q[3], q[16];
x q[28];
ccx q[28], q[3], q[15];
ccx q[28], q[2], q[16];
// Stage 9: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
//swap q[18],q[5];
cx q[18],q[5];
cx q[5],q[18];
cx q[18],q[5];
//swap q[17],q[4];
cx q[17],q[4];
cx q[4],q[17];
cx q[17],q[4];
//swap q[16],q[3];
cx q[16],q[3];
cx q[3],q[16];
cx q[16],q[3];
//swap q[15],q[2];
cx q[15],q[2];
cx q[2],q[15];
cx q[15],q[2];
// Stage 10 of Hamming control gates
// Stage 10: compute part  (12 qubits)
x q[27];
ccx q[27], q[25], q[12];
x q[27];
ccx q[27], q[25], q[11];
x q[27];
ccx q[27], q[24], q[11];
x q[27];
ccx q[27], q[24], q[10];
x q[27];
ccx q[27], q[23], q[10];
x q[27];
ccx q[27], q[23], q[9];
x q[27];
ccx q[27], q[22], q[9];
x q[27];
ccx q[27], q[22], q[8];
x q[27];
ccx q[27], q[21], q[8];
x q[27];
ccx q[27], q[21], q[7];
x q[27];
ccx q[27], q[20], q[7];
x q[27];
ccx q[27], q[20], q[6];
x q[27];
ccx q[27], q[19], q[6];
x q[27];
ccx q[27], q[19], q[5];
x q[27];
ccx q[27], q[18], q[5];
x q[27];
ccx q[27], q[18], q[4];
x q[27];
ccx q[27], q[17], q[4];
x q[27];
ccx q[27], q[17], q[3];
x q[27];
ccx q[27], q[16], q[3];
x q[27];
ccx q[27], q[16], q[2];
x q[27];
ccx q[27], q[15], q[2];
x q[27];
ccx q[27], q[15], q[1];
// Stage 10: uncompute part  (12 qubits)
cx q[12], q[25];
x q[27];
ccx q[27], q[11], q[24];
x q[27];
ccx q[27], q[11], q[23];
x q[27];
ccx q[27], q[10], q[23];
x q[27];
ccx q[27], q[10], q[22];
x q[27];
ccx q[27], q[9], q[22];
x q[27];
ccx q[27], q[9], q[21];
x q[27];
ccx q[27], q[8], q[21];
x q[27];
ccx q[27], q[8], q[20];
x q[27];
ccx q[27], q[7], q[20];
x q[27];
ccx q[27], q[7], q[19];
x q[27];
ccx q[27], q[6], q[19];
x q[27];
ccx q[27], q[6], q[18];
x q[27];
ccx q[27], q[5], q[18];
x q[27];
ccx q[27], q[5], q[17];
x q[27];
ccx q[27], q[4], q[17];
x q[27];
ccx q[27], q[4], q[16];
x q[27];
ccx q[27], q[3], q[16];
x q[27];
ccx q[27], q[3], q[15];
x q[27];
ccx q[27], q[2], q[15];
x q[27];
ccx q[27], q[2], q[14];
ccx q[27], q[1], q[15];
// Stage 10: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
//swap q[18],q[5];
cx q[18],q[5];
cx q[5],q[18];
cx q[18],q[5];
//swap q[17],q[4];
cx q[17],q[4];
cx q[4],q[17];
cx q[17],q[4];
//swap q[16],q[3];
cx q[16],q[3];
cx q[3],q[16];
cx q[16],q[3];
//swap q[15],q[2];
cx q[15],q[2];
cx q[2],q[15];
cx q[15],q[2];
//swap q[14],q[1];
cx q[14],q[1];
cx q[1],q[14];
cx q[14],q[1];
// Stage 11 of Hamming control gates
// Stage 11: compute part  (12 qubits)
x q[26];
ccx q[26], q[25], q[12];
x q[26];
ccx q[26], q[25], q[11];
x q[26];
ccx q[26], q[24], q[11];
x q[26];
ccx q[26], q[24], q[10];
x q[26];
ccx q[26], q[23], q[10];
x q[26];
ccx q[26], q[23], q[9];
x q[26];
ccx q[26], q[22], q[9];
x q[26];
ccx q[26], q[22], q[8];
x q[26];
ccx q[26], q[21], q[8];
x q[26];
ccx q[26], q[21], q[7];
x q[26];
ccx q[26], q[20], q[7];
x q[26];
ccx q[26], q[20], q[6];
x q[26];
ccx q[26], q[19], q[6];
x q[26];
ccx q[26], q[19], q[5];
x q[26];
ccx q[26], q[18], q[5];
x q[26];
ccx q[26], q[18], q[4];
x q[26];
ccx q[26], q[17], q[4];
x q[26];
ccx q[26], q[17], q[3];
x q[26];
ccx q[26], q[16], q[3];
x q[26];
ccx q[26], q[16], q[2];
x q[26];
ccx q[26], q[15], q[2];
x q[26];
ccx q[26], q[15], q[1];
x q[26];
ccx q[26], q[14], q[1];
x q[26];
ccx q[26], q[14], q[0];
// Stage 11: uncompute part  (12 qubits)
cx q[12], q[25];
x q[26];
ccx q[26], q[11], q[24];
x q[26];
ccx q[26], q[11], q[23];
x q[26];
ccx q[26], q[10], q[23];
x q[26];
ccx q[26], q[10], q[22];
x q[26];
ccx q[26], q[9], q[22];
x q[26];
ccx q[26], q[9], q[21];
x q[26];
ccx q[26], q[8], q[21];
x q[26];
ccx q[26], q[8], q[20];
x q[26];
ccx q[26], q[7], q[20];
x q[26];
ccx q[26], q[7], q[19];
x q[26];
ccx q[26], q[6], q[19];
x q[26];
ccx q[26], q[6], q[18];
x q[26];
ccx q[26], q[5], q[18];
x q[26];
ccx q[26], q[5], q[17];
x q[26];
ccx q[26], q[4], q[17];
x q[26];
ccx q[26], q[4], q[16];
x q[26];
ccx q[26], q[3], q[16];
x q[26];
ccx q[26], q[3], q[15];
x q[26];
ccx q[26], q[2], q[15];
x q[26];
ccx q[26], q[2], q[14];
x q[26];
ccx q[26], q[1], q[14];
x q[26];
ccx q[26], q[1], q[13];
ccx q[26], q[0], q[14];
// Stage 11: swap part  (12 qubits)
//swap q[25],q[12];
cx q[25],q[12];
cx q[12],q[25];
cx q[25],q[12];
//swap q[24],q[11];
cx q[24],q[11];
cx q[11],q[24];
cx q[24],q[11];
//swap q[23],q[10];
cx q[23],q[10];
cx q[10],q[23];
cx q[23],q[10];
//swap q[22],q[9];
cx q[22],q[9];
cx q[9],q[22];
cx q[22],q[9];
//swap q[21],q[8];
cx q[21],q[8];
cx q[8],q[21];
cx q[21],q[8];
//swap q[20],q[7];
cx q[20],q[7];
cx q[7],q[20];
cx q[20],q[7];
//swap q[19],q[6];
cx q[19],q[6];
cx q[6],q[19];
cx q[19],q[6];
//swap q[18],q[5];
cx q[18],q[5];
cx q[5],q[18];
cx q[18],q[5];
//swap q[17],q[4];
cx q[17],q[4];
cx q[4],q[17];
cx q[17],q[4];
//swap q[16],q[3];
cx q[16],q[3];
cx q[3],q[16];
cx q[16],q[3];
//swap q[15],q[2];
cx q[15],q[2];
cx q[2],q[15];
cx q[15],q[2];
//swap q[14],q[1];
cx q[14],q[1];
cx q[1],q[14];
cx q[14],q[1];
//swap q[13],q[0];
cx q[13],q[0];
cx q[0],q[13];
cx q[13],q[0];
// The Hamming-weight register has now been set up.
// Next, we add 12 Hadamard gates and 564 random controlled Clifford gates
h q[12];
h q[11];
h q[10];
h q[9];
h q[8];
h q[7];
h q[6];
h q[5];
h q[4];
h q[3];
h q[2];
h q[1];
// Next we add the 564 random controlled Clifford gates
cx q[17],q[6];
ccy q[16],q[7],q[4];
cs q[14],q[3];
cz q[14],q[1];
cs q[18],q[11];
ccz q[16],q[11],q[10];
ccy q[16],q[1],q[12];
ccy q[17],q[9],q[12];
ccy q[18],q[8],q[2];
ccx q[23],q[3],q[7];
cx q[22],q[6];
cs q[24],q[4];
ccz q[18],q[5],q[10];
ch q[21],q[8];
ch q[25],q[5];
ccx q[20],q[4],q[1];
ccx q[17],q[11],q[2];
cs q[13],q[5];
ch q[17],q[6];
ccx q[14],q[8],q[4];
ccy q[21],q[4],q[2];
ch q[19],q[8];
ccz q[14],q[3],q[4];
ccy q[13],q[8],q[7];
ccy q[19],q[4],q[8];
ccz q[22],q[4],q[7];
ccy q[15],q[12],q[4];
cs q[23],q[9];
ccx q[21],q[5],q[11];
ch q[17],q[5];
cy q[16],q[10];
cz q[24],q[1];
ccz q[23],q[1],q[5];
ccy q[15],q[6],q[2];
ch q[15],q[2];
ccz q[16],q[6],q[8];
ccy q[21],q[11],q[7];
cz q[20],q[2];
ch q[13],q[5];
ccz q[13],q[11],q[10];
ch q[18],q[8];
cx q[18],q[10];
ch q[25],q[11];
ccz q[17],q[10],q[7];
cx q[17],q[8];
cx q[20],q[12];
ccz q[22],q[8],q[4];
cy q[19],q[6];
ccz q[17],q[9],q[12];
cy q[24],q[2];
cy q[18],q[5];
ccx q[14],q[11],q[7];
ccx q[19],q[9],q[8];
ch q[19],q[9];
cx q[19],q[2];
cz q[18],q[5];
ccy q[16],q[5],q[1];
cz q[20],q[4];
cs q[20],q[12];
ccy q[19],q[7],q[5];
ccz q[19],q[4],q[11];
ccz q[17],q[3],q[8];
ccy q[15],q[8],q[5];
ccz q[18],q[6],q[7];
ccx q[15],q[2],q[11];
ccy q[23],q[6],q[1];
cy q[14],q[5];
cx q[22],q[11];
ccx q[25],q[2],q[5];
ccx q[13],q[1],q[3];
ccz q[17],q[10],q[1];
ccz q[23],q[2],q[12];
ccy q[13],q[9],q[2];
ccx q[21],q[8],q[3];
ccx q[18],q[5],q[3];
cy q[25],q[9];
ch q[16],q[3];
ch q[23],q[4];
cz q[20],q[12];
ccx q[21],q[5],q[10];
ccz q[21],q[8],q[11];
cz q[22],q[8];
cy q[16],q[7];
ccy q[20],q[7],q[6];
ccy q[21],q[2],q[6];
ccy q[14],q[4],q[8];
cx q[17],q[1];
cy q[20],q[12];
cx q[19],q[4];
ch q[13],q[12];
ccz q[18],q[4],q[7];
ccx q[17],q[7],q[4];
cs q[17],q[3];
cz q[23],q[3];
ccz q[13],q[4],q[8];
ccy q[24],q[3],q[1];
ccx q[23],q[6],q[7];
ccz q[24],q[3],q[1];
ccy q[15],q[2],q[12];
ccz q[13],q[1],q[6];
cs q[22],q[5];
cy q[21],q[2];
cx q[23],q[8];
cx q[25],q[3];
ch q[21],q[10];
ccz q[19],q[4],q[10];
cs q[15],q[6];
cy q[17],q[9];
ccz q[16],q[12],q[11];
ccz q[20],q[8],q[11];
ccx q[16],q[7],q[10];
ccz q[25],q[3],q[4];
ch q[23],q[7];
cs q[18],q[1];
ccz q[24],q[1],q[8];
cy q[18],q[12];
cs q[17],q[1];
ch q[22],q[5];
ccy q[19],q[1],q[9];
ccx q[14],q[11],q[10];
cs q[13],q[10];
ccz q[25],q[11],q[3];
ccx q[17],q[10],q[2];
cz q[25],q[1];
ccx q[17],q[8],q[10];
ccy q[21],q[7],q[12];
ccy q[20],q[9],q[5];
ccx q[24],q[3],q[8];
ccx q[22],q[6],q[7];
ccx q[23],q[6],q[8];
ccx q[18],q[3],q[11];
ccz q[25],q[1],q[6];
ch q[17],q[2];
ch q[18],q[7];
ch q[22],q[9];
cx q[15],q[5];
ccz q[18],q[6],q[9];
ccy q[18],q[6],q[10];
ccy q[20],q[6],q[12];
cs q[13],q[4];
cx q[20],q[12];
ccz q[24],q[12],q[2];
ccx q[21],q[10],q[6];
cs q[15],q[9];
cs q[13],q[5];
cy q[17],q[3];
cs q[17],q[6];
ccy q[17],q[11],q[7];
cz q[22],q[1];
ccz q[23],q[2],q[8];
ccz q[15],q[4],q[1];
cy q[16],q[9];
cz q[19],q[7];
ccx q[14],q[2],q[3];
cs q[15],q[5];
cy q[18],q[11];
ccz q[23],q[2],q[9];
cx q[15],q[6];
cy q[17],q[11];
cx q[19],q[1];
cz q[21],q[10];
ccy q[13],q[3],q[4];
ccy q[18],q[12],q[10];
cx q[19],q[5];
cy q[25],q[12];
cy q[16],q[9];
cz q[13],q[10];
ccx q[20],q[10],q[2];
cz q[17],q[1];
ccx q[14],q[10],q[5];
ccz q[18],q[8],q[12];
ccz q[24],q[7],q[9];
ccz q[19],q[11],q[6];
ccx q[19],q[8],q[5];
ccy q[17],q[12],q[3];
ccx q[13],q[11],q[6];
ccy q[23],q[3],q[12];
ccz q[22],q[8],q[4];
ccz q[17],q[9],q[7];
ccy q[16],q[11],q[5];
cs q[19],q[7];
ccy q[18],q[12],q[9];
cs q[24],q[10];
ccx q[13],q[3],q[10];
cz q[19],q[3];
cx q[15],q[8];
cx q[17],q[12];
ccz q[18],q[1],q[2];
ccz q[24],q[4],q[7];
cs q[22],q[7];
ccx q[17],q[11],q[4];
ccy q[24],q[11],q[9];
cx q[15],q[3];
cy q[23],q[3];
ccz q[14],q[4],q[1];
ccx q[20],q[2],q[12];
cx q[19],q[8];
ccx q[20],q[2],q[6];
ccx q[13],q[8],q[5];
cz q[13],q[9];
cs q[24],q[9];
cx q[14],q[9];
cs q[13],q[9];
cz q[22],q[10];
cs q[14],q[9];
ch q[25],q[1];
cx q[16],q[8];
ch q[20],q[11];
ccy q[23],q[11],q[8];
ch q[20],q[6];
ch q[19],q[8];
ccx q[18],q[5],q[6];
ccy q[19],q[7],q[12];
ccx q[15],q[2],q[4];
ccx q[24],q[9],q[3];
ccx q[24],q[11],q[7];
ccy q[22],q[11],q[12];
cs q[18],q[3];
cy q[13],q[3];
ch q[23],q[9];
ccy q[23],q[6],q[11];
cz q[20],q[11];
ch q[24],q[6];
ccy q[15],q[11],q[4];
ccy q[21],q[12],q[2];
cy q[17],q[3];
cy q[13],q[3];
ccx q[21],q[11],q[10];
cy q[18],q[10];
ccy q[25],q[2],q[4];
ch q[15],q[10];
cz q[22],q[9];
cx q[21],q[11];
cs q[18],q[3];
ch q[14],q[8];
ccz q[25],q[11],q[10];
ccy q[16],q[3],q[11];
cz q[25],q[10];
ccz q[24],q[8],q[7];
ccy q[22],q[1],q[6];
ch q[20],q[3];
ccy q[13],q[10],q[4];
cz q[20],q[3];
ccx q[22],q[10],q[6];
ccx q[20],q[4],q[12];
ccx q[23],q[11],q[10];
cx q[14],q[11];
cs q[16],q[6];
ccz q[24],q[12],q[2];
ch q[17],q[9];
ccz q[13],q[8],q[11];
cs q[19],q[1];
cz q[14],q[12];
ch q[14],q[5];
cs q[13],q[11];
ccz q[23],q[1],q[3];
ccy q[25],q[8],q[4];
cy q[18],q[5];
ccy q[22],q[5],q[11];
ccy q[21],q[12],q[4];
ccy q[18],q[4],q[12];
ccy q[19],q[9],q[7];
cz q[13],q[8];
ccy q[20],q[11],q[4];
ccy q[19],q[10],q[7];
cy q[14],q[7];
ccx q[21],q[4],q[5];
ccz q[17],q[2],q[9];
ccy q[24],q[1],q[5];
cs q[14],q[12];
cz q[22],q[12];
cx q[25],q[7];
ccy q[18],q[2],q[6];
ccy q[21],q[12],q[6];
cx q[19],q[8];
cx q[25],q[5];
ch q[14],q[10];
ch q[25],q[10];
ccz q[18],q[4],q[1];
ccz q[16],q[3],q[8];
cz q[20],q[3];
ccx q[14],q[3],q[12];
ccx q[25],q[3],q[8];
ccy q[16],q[12],q[4];
ccx q[15],q[1],q[2];
ccz q[25],q[2],q[5];
cy q[21],q[11];
cz q[21],q[5];
cz q[20],q[8];
ccy q[21],q[3],q[9];
cs q[14],q[10];
cs q[25],q[4];
cx q[20],q[8];
ccy q[16],q[4],q[3];
ccy q[15],q[3],q[8];
cx q[17],q[8];
ccz q[13],q[2],q[7];
ch q[18],q[1];
cz q[20],q[7];
ch q[19],q[2];
ch q[15],q[5];
ccy q[23],q[11],q[5];
ccz q[18],q[6],q[1];
cy q[16],q[5];
ccx q[17],q[10],q[6];
ccz q[24],q[11],q[9];
cx q[19],q[11];
ccz q[14],q[2],q[11];
ccy q[18],q[10],q[7];
cx q[23],q[10];
ccx q[21],q[1],q[5];
cs q[13],q[3];
cz q[19],q[8];
ccx q[14],q[11],q[8];
ccz q[21],q[9],q[8];
cx q[17],q[5];
ch q[22],q[4];
cx q[25],q[7];
ccz q[22],q[11],q[6];
cs q[24],q[4];
cy q[20],q[5];
cx q[25],q[7];
ccz q[24],q[5],q[1];
ccy q[18],q[12],q[2];
cy q[24],q[8];
ccy q[24],q[2],q[7];
ccy q[22],q[2],q[3];
ccz q[24],q[7],q[3];
ccy q[15],q[8],q[11];
cs q[24],q[9];
cx q[23],q[7];
ccz q[15],q[5],q[6];
ccy q[17],q[3],q[12];
ccz q[24],q[2],q[6];
cy q[15],q[4];
ccx q[13],q[11],q[1];
ccz q[22],q[6],q[1];
cx q[22],q[9];
cz q[17],q[1];
ccy q[24],q[12],q[4];
ccz q[21],q[4],q[9];
ccz q[18],q[2],q[6];
ccx q[20],q[4],q[9];
ccx q[22],q[1],q[4];
ccx q[22],q[12],q[4];
ch q[13],q[9];
cy q[19],q[2];
ccy q[14],q[6],q[9];
cy q[15],q[4];
ccx q[24],q[12],q[2];
ccz q[25],q[10],q[3];
ccz q[14],q[2],q[3];
cs q[16],q[12];
cy q[23],q[7];
ccz q[25],q[9],q[2];
ch q[21],q[12];
ccy q[21],q[11],q[4];
ccz q[21],q[10],q[6];
cx q[13],q[4];
ccy q[13],q[12],q[2];
ccz q[17],q[7],q[8];
ccx q[14],q[1],q[11];
ccz q[20],q[2],q[11];
ccz q[13],q[11],q[9];
ccy q[14],q[7],q[5];
ccy q[23],q[4],q[2];
cx q[25],q[12];
cy q[20],q[3];
cy q[18],q[5];
cy q[16],q[2];
cx q[15],q[8];
ch q[22],q[3];
cz q[19],q[6];
ccy q[17],q[5],q[6];
ccy q[21],q[1],q[10];
ccy q[20],q[1],q[9];
cx q[17],q[1];
cy q[22],q[7];
cs q[17],q[10];
ccx q[23],q[3],q[1];
ccy q[14],q[9],q[8];
cz q[25],q[3];
cz q[25],q[4];
ccy q[20],q[4],q[8];
ccy q[16],q[11],q[7];
cx q[14],q[3];
cs q[17],q[5];
ccy q[23],q[4],q[10];
ccy q[16],q[2],q[9];
cx q[23],q[5];
ccy q[21],q[7],q[10];
cs q[17],q[9];
cy q[13],q[11];
ccz q[16],q[6],q[5];
ch q[21],q[9];
ch q[14],q[10];
ccy q[16],q[10],q[4];
ccz q[24],q[1],q[9];
ccx q[18],q[5],q[1];
cy q[22],q[3];
cz q[25],q[5];
cy q[23],q[2];
cy q[24],q[8];
ccx q[20],q[8],q[4];
cs q[25],q[5];
cy q[22],q[4];
ccz q[21],q[3],q[4];
ccy q[25],q[10],q[5];
ccz q[17],q[5],q[9];
ccz q[19],q[5],q[8];
ccy q[25],q[11],q[12];
ccz q[18],q[8],q[1];
ccz q[25],q[10],q[9];
cy q[22],q[7];
cs q[15],q[11];
ccz q[22],q[2],q[10];
cz q[21],q[2];
ccz q[18],q[7],q[2];
cz q[21],q[8];
cs q[13],q[5];
ccz q[22],q[7],q[6];
cx q[14],q[8];
ccy q[15],q[7],q[3];
ch q[19],q[2];
cx q[15],q[9];
cz q[15],q[1];
ccz q[22],q[4],q[2];
cz q[22],q[8];
ccz q[19],q[7],q[5];
cx q[23],q[9];
ccz q[14],q[8],q[4];
ccx q[22],q[6],q[10];
cz q[19],q[5];
cz q[17],q[1];
cy q[16],q[11];
ccx q[18],q[12],q[8];
cs q[19],q[3];
cs q[17],q[9];
ccy q[25],q[6],q[7];
cy q[15],q[12];
cy q[19],q[3];
cs q[22],q[8];
cs q[20],q[7];
cx q[17],q[5];
ccx q[23],q[10],q[5];
ccy q[19],q[8],q[1];
ccx q[19],q[8],q[2];
ccx q[25],q[12],q[1];
ccz q[19],q[6],q[7];
ccy q[25],q[4],q[2];
ccy q[13],q[2],q[1];
ccx q[16],q[6],q[12];
ccx q[23],q[2],q[8];
ccx q[16],q[7],q[10];
ccy q[14],q[6],q[11];
ccz q[17],q[12],q[6];
cs q[19],q[12];
ccx q[16],q[9],q[12];
ccy q[19],q[10],q[4];
cz q[15],q[3];
ccx q[19],q[11],q[10];
cz q[13],q[2];
cx q[20],q[8];
cy q[25],q[4];
ccx q[24],q[4],q[11];
ccy q[18],q[12],q[10];
ch q[17],q[8];
cx q[20],q[9];
ccx q[14],q[1],q[3];
ccx q[19],q[9],q[12];
ccy q[25],q[3],q[8];
cx q[13],q[8];
ccz q[13],q[8],q[7];
ccz q[18],q[10],q[12];
cz q[24],q[5];
ch q[20],q[7];
ccy q[25],q[6],q[2];
cy q[20],q[9];
ccy q[23],q[8],q[9];
ccx q[22],q[4],q[5];
ccx q[17],q[12],q[2];
cy q[15],q[5];
cy q[21],q[12];
ccx q[23],q[5],q[6];
cs q[23],q[10];
ccz q[19],q[1],q[2];
cx q[20],q[3];
ccy q[14],q[6],q[5];
cy q[25],q[1];
ccz q[20],q[1],q[6];
cx q[17],q[12];
ccy q[19],q[8],q[10];
ccy q[13],q[6],q[12];
ccx q[15],q[9],q[2];
cy q[15],q[8];
ccy q[25],q[8],q[7];
cx q[13],q[1];
ccx q[14],q[2],q[9];
ccz q[16],q[2],q[10];
ccy q[17],q[8],q[4];
ccy q[20],q[8],q[9];
ccz q[21],q[2],q[12];
cy q[17],q[7];
ch q[19],q[5];
ccy q[19],q[5],q[6];
ccz q[22],q[9],q[4];
ccz q[22],q[10],q[11];
ch q[20],q[1];
ch q[20],q[9];
ch q[22],q[3];
ccx q[19],q[3],q[11];
ccx q[22],q[3],q[9];
cz q[18],q[1];
ccy q[23],q[6],q[1];
cy q[13],q[7];
cy q[19],q[5];
cz q[23],q[6];
ccy q[24],q[5],q[4];
ch q[17],q[12];
ccx q[19],q[11],q[1];
ccz q[17],q[6],q[12];
ccy q[23],q[6],q[8];
ccz q[18],q[5],q[7];
ccx q[18],q[6],q[2];
cz q[15],q[2];
cz q[19],q[1];
ccz q[22],q[6],q[2];
ch q[20],q[1];
ch q[15],q[5];
ccy q[20],q[7],q[2];
cx q[13],q[9];
cy q[15],q[10];
ccy q[13],q[1],q[5];
ccz q[16],q[6],q[9];
ccy q[24],q[2],q[8];
cy q[24],q[11];
ccz q[20],q[11],q[12];
ccx q[13],q[5],q[2];
ccy q[21],q[7],q[2];
cz q[21],q[7];
cs q[21],q[5];
cx q[13],q[12];
cs q[20],q[6];
cz q[22],q[9];
cz q[17],q[4];
ccx q[17],q[11],q[2];
ccz q[20],q[7],q[9];
cs q[23],q[9];
ccz q[23],q[8],q[3];
cz q[19],q[9];
ch q[14],q[4];
cz q[13],q[9];
ccy q[13],q[8],q[10];
ccx q[18],q[3],q[5];
cy q[16],q[5];
ch q[19],q[9];
cx q[20],q[12];
ccx q[25],q[5],q[4];
ccz q[19],q[11],q[5];
ccx q[17],q[12],q[2];
ccy q[19],q[5],q[2];
ccy q[22],q[2],q[3];
cz q[19],q[3];
ccz q[17],q[8],q[9];
