
[MT,rho] = proc.script.MapTools.import('export/mac1_edens.h5','unwrapped_cropped','rho');
load proc/goodvibes_model.mat ENM ResidueGroups M
load proc/reference_halos.mat hklGrid

% interpolate structure factors around reference peaks
[h,k,l] = gridarray2hkl(hklGrid);
supercell = hklGrid(1).invert.P;

LDT = proc.script.LatticeDynamicsTools('supercell',supercell,'Cell',ENM.Cell,'M',M);

sffun = LDT.calc1PSFInterpFromMap(rho,MT.Grid,MT.Basis);
[Gk,ind] = LDT.precompute1PSFs(sffun,h,k,l);

save proc/reference_calc.mat Gk ind LDT