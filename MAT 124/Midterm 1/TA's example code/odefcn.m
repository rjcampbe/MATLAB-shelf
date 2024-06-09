
% dU/dt = a - bU - cV;
% dV/dt = q - UV + dW;
% dW/dt = e + fW - gUV;
% y(1) = U, y(2)=V, y(3)=W y is the variable which stores independent
%variables U, V and W

% y = [U V W],  dy/dt = [dU/dt   dV/dt   dW/dt]
% y(1) = U, y(2) =V, y(3) = W

function dydt = odefcn(t,y,a,b,c,q,d,e,f,g)
  dydt = zeros(3,1);
  dydt(1) = a - b*y(1) - c*y(2);
  dydt(2) = q - y(1).*y(2) + d*y(3); %multiplying 2 vectors
  dydt(3) = e + f*y(3) - g*y(1).*y(2);
end

