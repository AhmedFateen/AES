function hexOutput =outputDec2HexFormatted(decimalInput)
% decimal converted to hex
% hexOutput concatenated in this format 'AF1FAA4EEB9453C0B1CB4F87E74F4AC5'
hex=dec2hex(decimalInput);
hexOutput=[];
for i=1:length(hex)
    hexOutput=[hexOutput hex(i,:)];
end
end