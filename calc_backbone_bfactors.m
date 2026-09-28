function [stats] = calc_backbone_bfactors(Atoms,C,tlsori,Tcor)

% per-residue B-factors (BACKBONE atoms)
isIncl = Atoms.mdxChemicalGroup=="backbone" & Atoms.mdxAtomicSymbol~="H";
Atoms = Atoms(isIncl,:);

[Atoms.Biso] = calc_Biso(Atoms.mdxFormFactor);
[Atoms.Blatt] = calc_Blatt(Atoms,C,tlsori); 

stats = groupsummary(Atoms,{'chainID','resSeq'},{'min','max','mean'},...
    {'Biso','Blatt'},'IncludeEmptyGroups',true);

stats.Blatt_cor = ones(size(stats,1),1)*8*pi^2*trace(Tcor)/3;

function B = calc_Biso(FF)
U = arrayfun(@(ff) ff.U,FF,'Uni',0);
B = cellfun(@(u) 8*pi^2*trace(u)/3,U);
end

function Blatt = calc_Blatt(Atoms,Clatt,ori)
if nargin < 3 || isempty(ori)
    ori = [0,0,0];
end
P = arrayfun(@(x,y,z) nm.Group(x,y,z).tl2uxyz,Atoms.x - ori(1),Atoms.y - ori(2),Atoms.z - ori(3),'Uni',0);
Ulatt = cellfun(@(p) p*Clatt(1:6,1:6)*p',P,'Uni',0);
Blatt = cellfun(@(u) 8*pi^2*trace(u)/3,Ulatt);
end

end