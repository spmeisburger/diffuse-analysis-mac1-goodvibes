
function [T,L,S,rcor,Tcor,Lcor,Scor] = tls_analysis(C)

C = C(1:6,1:6);

T = C(1:3,1:3); % A^2
L = C(4:6,4:6);
S = C(4:6,1:3);

A = trace(L)*eye(3)-L;
b = [S(2,3)-S(3,2);S(3,1)-S(1,3);S(1,2)-S(2,1)];
rcor = A\b;

cmat = @(r1,r2,r3) sparse([3,1,2,2,3,1],[2,3,1,3,1,2],[r1,r2,r3,-r1,-r2,-r3],3,3);

Oshift = kron(sparse(1,2,1,2,2),cmat(-rcor(1),-rcor(2),-rcor(3))) + speye(6,6);

C0 = Oshift*C*Oshift';

Tcor = C0(1:3,1:3); % A^2
Lcor = C0(4:6,4:6);
Scor = C0(4:6,1:3);

end