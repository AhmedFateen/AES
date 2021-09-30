

function state_in = invMixColumns (state_out)
% The output of this function should be the state matrix before mix_columns
% (The input to mix_columns)

% defining the irreducible polynomial
irr_p = bin2dec ('100011011');
% the matrix we multiply the state matrix by
Pmatrix=[14 11 13 9;...
         9 14 11 13;...
         13 9 14 11;...
         11 13 9 14];

% Looping over columns of state_out matrix
for i_col = 1 : 4
        
    % Looping over the rows of state_out matrix
    for i_row = 1 : 4

        temp = 0;
        
        for j = 1 : 4
        
           % multiplying the current element of the current row vector of 
           % Pmatrix with the current element of the current column vector 
           % of the state_out matrix
            temp_prod = pMult (Pmatrix(i_row, j), state_out(j, i_col),irr_p);
            
            temp = bitxor (temp, temp_prod);
                        
        end
        
        state_in(i_row, i_col) = temp;
        
    end
    
end



