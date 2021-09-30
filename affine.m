function aff_trans= affine(decimal)
% Affine transform of a byte
bin_form=dec2bin(decimal,8);
vector_form=flip(transpose(bin_form-'0'));
output_vector=mod([1 0 0 0 1 1 1 1;...
    1 1 0 0 0 1 1 1;1 1 1 0 0 0 1 1;1 1 1 1 0 0 0 1;1 1 1 1 1 0 0 0;...
    0 1 1 1 1 1 0 0;0 0 1 1 1 1 1 0;0 0 0 1 1 1 1 1]...
    *vector_form+transpose([1 1 0 0 0 1 1 0]),2);
str_x = num2str(transpose(flip(output_vector)));

str_x(isspace(str_x)) = '';
aff_trans=bin2dec(str_x);

