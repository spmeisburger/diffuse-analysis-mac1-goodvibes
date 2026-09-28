
function [params,anisoscales] = anisoscaling(T,Basis,SpaceGroup)

SM = proc.script.ScaleModelToFobs('Basis',Basis.orient(),'SpaceGroup',SpaceGroup);

[T.sx,T.sy,T.sz] = SM.Basis.invert.frac2lab(T.h,T.k,T.l);

tt = T;
tt = tt(~isnan(tt.Imerge) & ~isnan(tt.Fobs) & tt.sigmaImerge>0,:); % get rid of NaNs

[numParams,param2struct] = SM.parameterize_model();
p2s = @(v) param2struct([v(1),0,0,v(2:(numParams-2))]); % HACK to remove ksol, Bsol from fitting model

Taniso = @(s) latt.Blob(1,0).addU(s.U).rescale(s.ktot);
residfun = @(s,t) (t.Imerge - abs(Taniso(s).scatteringAmplitude(t.sx,t.sy,t.sz).*t.Fobs).^2)./t.sigmaImerge;

solvFit = lsqnonlin(@(v) residfun(p2s(v/1000),tt),1000*[1,0,0],[],[]);

params = p2s(solvFit/1000);

anisoscales = latt.Blob(1,0).addU(params.U).scatteringAmplitude(T.sx,T.sy,T.sz);

end