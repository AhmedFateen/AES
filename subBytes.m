function bytes_out=subBytes(bytes_in,boxtype)
if boxtype==1
sbox=s_box();
else
    sbox=inverse_s_box();
end
bytes_out = sbox (bytes_in + 1);
