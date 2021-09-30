function ciphertext=encryptCBC(plaintext,Key,IV)
if mod(numel(plaintext),16)~=0
    error('Cannot work with this plaintext. Consider padding')
end
if iscell (IV) | numel (IV) ~= 16

    error ('IV has to be a vector (not a cell array) with 16 elements.')
    
end

% If any element of the input vector cannot be represented by 8 bits
if any (IV < 0 | IV > 255)
    
    error ('Elements of IV vector have to be bytes (0 <= IV(i) <= 255).')
    
end

expandedKey=keyExpansion(Key);
nBlocks=numel(plaintext)/16;
ciphertext=encipher(bitxor(plaintext(1:16),IV),expandedKey);
result=ciphertext;

for i=2:nBlocks
    result=encipher(bitxor(plaintext(16*(i-1)+1:16*i),result),expandedKey);
    ciphertext=[ciphertext result];
end
end

