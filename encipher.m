function ciphertext=encipher(plaintext,expandedKey)
%   plaintext has to be a vector of 16 bytes (0 <= plaintext(i) <= 255).
%   expandedKey has to be a [44 x 4]-matrix of bytes (0 <= W(i,j) <= 255)

if iscell (plaintext) | numel (plaintext) ~= 16

    error ('plaintext has to be a vector with 16 elements.')
    
end

% If any element of the plaintext vector cannot be represented by 8 bits
if any (plaintext < 0 | plaintext > 255)
    
    error ('Elements of plaintext vector have to be bytes (0 <= plaintext(i) <= 255).')
    
end
if iscell (expandedKey) | size (expandedKey) ~= [44, 4]

    % Inform user and abort
    error ('expandedKey has to be an array with [44 x 4] elements.')
    
end
% If any element of the expanded key array can not be represented by 8 bits
if any (expandedKey < 0 | expandedKey > 255)
    
    % Inform user and abort
    error ('Elements of the expanded key array have to be bytes (0 <= expandedKey(i,j) <= 255).')
    
end
% Copy the 16 elements of the input vector 
% column-wise into the 4 x 4 state matrix
state = reshape (plaintext, 4, 4);
   
% Copy the first 4 rows (4 x 4 elements) of the expanded key 
% into the current round key.
% Transpose to make this column-wise
round_key = (expandedKey(1:4, :))';


% Add the current round key to the state
state = add_round_key (state, round_key);

% Loop over 9 rounds
for i_round = 1 : 9
    
    
    state = subBytes (state,1);
    state = shiftRows (state);
    state = mixColumns (state);
    
    % Extract the current round key (4 x 4 matrix) from the expanded key
    round_key = (expandedKey((1:4) + 4*i_round, :))';
   
    % Add the current round key to the state
    state = add_round_key (state, round_key);
    
end
   

state = subBytes (state,1);
state = shiftRows (state);
    
% Extract the last round key (4 x 4 matrix) from the expanded key
round_key = (expandedKey(41:44, :))';

% Add the current round key to the state
state = add_round_key (state, round_key);
    
% reshape the 4 x 4 state matrix into a 16 element row vector
ciphertext = reshape (state, 1, 16);