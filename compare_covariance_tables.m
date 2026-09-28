
function [T,fit_iso,fit_aniso] = compare_covariance_tables(Tdb,Tgv)

discoball = preprocess_covariance_table(Tdb);
goodvibes = preprocess_covariance_table(Tgv);
T = innerjoin(discoball,goodvibes,'Keys',{'n1','n2','n3'},'RightVariables',{'viso','vaniso'});

x = T.viso_discoball;
y = T.viso_goodvibes;

p = polyfit(x,y,1);
ccmat = corrcoef(x,y);
cc = ccmat(1,2);
fit_iso = struct('x',x,'y',y,'cc',cc,'p',p);

x = T.vaniso_discoball(:);
y = T.vaniso_goodvibes(:);

p = polyfit(x,y,1);
ccmat = corrcoef(x,y);
cc = ccmat(1,2);
fit_aniso = struct('x',x,'y',y,'cc',cc,'p',p);

end