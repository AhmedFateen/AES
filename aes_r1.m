function state_out=aes_r1(plaintext,subKey)
% plaintext and subKey are vectors of 16 bytes hexadecimal (16 rows) each
% output in decimal but can be comverted
state_out=reshape(plaintext,4,4);
state_out=add_round_key(state_out,reshape(subKey,4,4));
state_out=subBytes(state_out,1);
state_out=shiftRows(state_out);
state_out=mixColumns(state_out);
