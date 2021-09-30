function decimalOutput=inputHex2DecFormatted(hexInput)
% for example '02f3af0a0e877510c5a644952a5fc99b' becomes
% {'02','f3','af',....} then converted to decimal
n=length(hexInput);
if rem(n,2)~=0
    error('number of bits not even')
end
dim=[];
for i=1:n/2
    dim=[dim 2];
end
decimalOutput=hex2dec(mat2cell(hexInput,1,dim))'; % transpose to row vector