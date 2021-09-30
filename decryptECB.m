function plaintext=decryptECB(ciphertext,Key)
if mod(numel(ciphertext),16)~=0
    error('Cannot work with this plaintext. Consider padding')
end

expandedKey=keyExpansion(Key);
nBlocks=numel(ciphertext)/16;
plaintext=[];

for i=1:nBlocks
    result=decipher(ciphertext((16*(i-1)+1):16*i),expandedKey);
    plaintext=[plaintext result];
end
end
