function plaintext=decryptCBC(ciphertext,Key,IV)
if mod(numel(ciphertext),16)~=0
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
nBlocks=numel(ciphertext)/16;
plaintext=bitxor(decipher(ciphertext(1:16),expandedKey),IV);
result=plaintext;

for i=2:nBlocks
    result=bitxor(decipher(ciphertext(16*(i-1)+1:16*i),expandedKey),ciphertext(16*(i-2)+1:16*(i-1)));
    plaintext=[plaintext result];
end
end

