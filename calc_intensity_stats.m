
function T = calc_intensity_stats(MT,I,I1,I2,I_latt,edges)

SVR = proc.script.StatisticsVsRadius(...
    'edges',edges,...
    'Basis',MT.Basis,...
    'PeriodicGrid',MT.Grid);

stats_exp_half = SVR.run(I1,I2);
stats_ld_exp = SVR.run(I_latt,I);

cc12 = stats_exp_half.cc;
cc12(cc12<0) = 0; % make sure ccstar is real
ccstar = sqrt(2*cc12./(1+cc12));

s = stats_ld_exp.r;
sigmaI_exp = sqrt(stats_ld_exp.var2).*ccstar;
sigmaI_latt = sqrt(stats_ld_exp.var1);
cclatt = stats_ld_exp.cc;

T = table(s,sigmaI_exp,sigmaI_latt,cclatt,ccstar);

end