

function state_out = mixColumns (state_in)

% defining the irreducible polynomial
irr_p = bin2dec ('100011011');
% the matrix we multiply the state matrix by
Pmatrix=[2 3 1 1;...
         1 2 3 1;...
         1 1 2 3;...
         3 1 1 2];

% Looping over columns of state matrix
for i_col = 1 : 4
        
    % Looping over the rows of state matrix
    for i_row = 1 : 4

        temp = 0;
        
        for j = 1 : 4
        
            % Multiply (GF(2^8) polynomial multiplication)
            % the current element of the current row vector of Pmatrix with
            % the current element of the current column vector of the state matrix
            temp_prod = pMult (Pmatrix(i_row, j), state_in(j, i_col),irr_p);
            
            temp = bitxor (temp, temp_prod);
                        
        end
        
        state_out(i_row, i_col) = temp;
        
    end
    
end



