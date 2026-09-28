
function T = preprocess_covariance_table(T)
T.d = sqrt(T.x.^2 + T.y.^2 + T.z.^2);
isIncl = T.d>0;
T = T(isIncl,:);
T.viso = T.v11 + T.v22 + T.v33;
T.vaniso = cat(2,T.v11 - T.viso/3,T.v22 - T.viso/3, T.v33 - T.viso/3, T.v12,T.v13,T.v23);
T = T(:,{'n1','n2','n3','d','viso','vaniso'});
end