function plaintext = decipher (ciphertext, expandedKey)

%   CIPHERTEXT has to be a vector of 16 bytes (0 <= CIPHERTEXT(i) <= 255).
%   W has to be a [44 x 4]-matrix of bytes (0 <= W(i,j) <= 255).

% If the input vector is a cell array or does not have 16 elements
if iscell (ciphertext) | numel (ciphertext) ~= 16

    error ('Ciphertext has to be a vector (not a cell array) with 16 elements.')
    
end

% If any element of the input vector cannot be represented by 8 bits
if any (ciphertext < 0 | ciphertext > 255)
    
    error ('Elements of ciphertext vector have to be bytes (0 <= ciphertext(i) <= 255).')
    
end

% If the expanded key array is a cell arrray or does not have the correct size
if iscell (expandedKey) | any (size (expandedKey) ~= [44, 4])

    % Inform user and abort
    error ('expandedKey has to be an array with [44 x 4] elements.')
    
end

% If any element of the expanded key array can not be represented by 8 bits
if any (expandedKey < 0 | expandedKey > 255)
    
    error ('Elements of expandedKey have to be bytes (0 <= w(i,j) <= 255).')
    
end

% Copy the 16 elements of the input vector column-wise into the 4 x 4 state matrix
state = reshape (ciphertext, 4, 4);

% Copy the last 4 rows (4 x 4 elements) of the expanded key 
% into the current round key.
% Transpose to make this column-wise
round_key = (expandedKey(41:44, :))';
% Add the current round key to the state
state = add_round_key (state, round_key);

% Loop over 9 rounds backwards
for i_round = 9 : -1 : 1
    
    
    state = invShiftRows (state);
    
    state = subBytes (state,-1);
    
    % Extract the current round key (4 x 4 matrix) from the expanded key
    round_key = (expandedKey((1:4) + 4*i_round, :))';

    % Add the current round key to the state
    state = add_round_key (state, round_key);
    
    state = invMixColumns (state);
end
    
state = invShiftRows (state);
state = subBytes (state,-1);

% Extract the "first" (final) round key (4 x 4 matrix) from the expanded key
round_key = (expandedKey(1:4, :))';

% Add (xor) the current round key (matrix) to the state (matrix)
state = add_round_key (state, round_key);
    
% reshape the 4 x 4 state matrix into a 16 element row vector
plaintext = reshape (state, 1, 16);


