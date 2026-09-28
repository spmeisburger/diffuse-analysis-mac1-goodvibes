
function hklRef = selectStrongBraggPeaks(hklTable,Basis,numRef,resMin,resMax)

% filter by reflection range
[sx,sy,sz] = Basis.invert.frac2lab(hklTable.h,hklTable.k,hklTable.l);
s = sqrt(sx.^2 + sy.^2 + sz.^2);
isIncl = 1./s >= resMin & 1./s <= resMax & ~isnan(hklTable.Fobs);
hklTable = hklTable(isIncl,:);

% sort by Fobs and choose the most intense entries
[~,ixorder] = sort(hklTable.Fobs,'descend');
hklTable = hklTable(ixorder(1:numRef),:);

hklRef = table2array(hklTable(:,{'h','k','l'}));

end