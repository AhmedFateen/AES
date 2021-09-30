function xy=pMult(x,y,irr_p)
%Polynomial modulo multiplication in GF(2^8)
xy=0;
for i=1:8
    if (bitget(x,i)==1)
        % multiplication
        y_shift=bitshift(y,i-1);
        xy=bitxor (xy, y_shift);
    end
end

for i = 16 : -1 : 9
    
    if (bitget (xy, i)==1)
    
        % division
        irr_p_shift = bitshift (irr_p, i - 9);
        
        % "subtraction" stage
        xy = bitxor (xy, irr_p_shift);
        
    end
        
end