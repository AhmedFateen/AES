function w=keyExpansion(key)
% key is a vector of 16 bytes

if iscell (key) | numel (key) ~= 16

    error ('Key has to be a vector with 16 elements.')
    
end

% If any element of the key vector cannot be represented by 8 bits
if any (key < 0 | key > 255)
    
    error ('Elements of key vector have to be bytes (0 <= key(i) <= 255).')
    
end
w = (reshape (key, 4, 4))';
% Loop over the rest of the 44 rows of the expanded key
for i = 5 : 44
    
    % Copy the previous row of the expanded key into a buffer
    temp = w(i - 1, :);

    % Every fourth row is treated differently:
    if mod (i, 4) == 1
    
        % cyclic shift of the elements
        temp = temp([2 3 4 1]);

        temp = subBytes (temp,1);

         r_con=rcon();
         r = r_con ((i - 1)/4, :);
    
         temp = bitxor (temp, r); % add the current round constant
    end
    w(i, :) = bitxor (w(i - 4, :), temp);
end



