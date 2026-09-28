
function [MTx,MTy,MTz] = orthoslice_grid(MT)

% prepare slices
[f1,f2,f3] = MT.Grid.ind2frac(MT.Grid.N(1),MT.Grid.N(2),MT.Grid.N(3));
[MTx] = MT.resize('roi',[0,0,-f2,f2,-f3,f3]);
[MTy] = MT.resize('roi',[-f1,f1,0,0,-f3,f3]);
[MTz] = MT.resize('roi',[-f1,f1,-f2,f2,0,0]);

end