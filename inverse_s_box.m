function inv_s_box=inverse_s_box()
sbox=s_box();
for i = 1 : 256

    inv_s_box(sbox(i) + 1) = i - 1;

end