
function [h,k,l] = gridarray2hkl(hklGrid)

[h,k,l] = arrayfun(@(g) g.grid(),hklGrid,'Uni',0);
h = cell2mat(cellfun(@(v) shiftdim(v,-1),h,'uni',0));
k = cell2mat(cellfun(@(v) shiftdim(v,-1),k,'uni',0));
l = cell2mat(cellfun(@(v) shiftdim(v,-1),l,'uni',0));

end