function s_box=s_box()
for i = 1 : 256 %indices in MATLAB  start at 1
    s_box(i)=affine(mult_inverse(i-1));
end
