function rcon=rcon()

% irreducible polynomial
mod_pol = bin2dec ('100011011');
rcon(1)=1;
for i = 2 : 10

    rcon(i) = pMult (rcon(i-1), 2, mod_pol);
end
rcon = [rcon(:), zeros(10, 3)]; % the other 3 bytes are all zeroes
