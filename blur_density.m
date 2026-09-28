
function rhoBlur = blur_density(MT,rho,Badd)
[F,MTf] = MT.fourier_transform(rho);
[sx,sy,sz] = MTf.Grid.grid();
[sx,sy,sz] = MTf.Basis.frac2lab(sx,sy,sz);
Fblur = latt.Blob(1,0).addB(Badd).scatteringAmplitude(sx,sy,sz);
rhoBlur = MT.inverse_fourier_transform(F.*Fblur);
end