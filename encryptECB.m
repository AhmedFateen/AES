function ciphertext=encryptECB(plaintext,Key)
if mod(numel(plaintext),16)~=0
    error('Cannot work with this plaintext. Consider padding')
end

expandedKey=keyExpansion(Key);
nBlocks=numel(plaintext)/16;
ciphertext=[];

for i=1:nBlocks
    result=encipher(plaintext((16*(i-1)+1):16*i),expandedKey);
    ciphertext=[ciphertext result];
end
end

