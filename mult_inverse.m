function inv = mult_inverse (input) 
%   Find the multiplicative inverse in GF(2^8) using the irreducible
%   polynomial '100011011'
%   input has to be a byte (0 <= input <= 255) (decimal form)
%   The inverse of zero is defined as zero
if (input==0)
    inv=0;
    return;
end
for i = 1 : 255
    
    % searching byte by byte for the inverse
    prod = pMult (input, i, bin2dec('100011011'));

    % If the polynomial modulo multiplication leaves a remainder of "1"
    % we have found the inverse
    if prod == 1
    
        inv = i;
        
        break
        
    end
    
end
