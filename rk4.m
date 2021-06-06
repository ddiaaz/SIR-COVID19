function [t,w] = rk4(a,b,n,alpha,f)
% Fourth Order Runge-Kutta Function
h = (b-a)/n;
N = length(alpha);
t = zeros(N,n+1);
w = zeros(N,n+1);
t(1) = a;
w(:,1) = alpha;
t = a:h:b;

for i = 2:n+1
    k1 = h.*f((t(i-1)) ,w(:,i-1));
    k2 = h.*f((t(i-1) + (h/2)), w(:,i-1) + k1/2);
    k3 = h.*f((t(i-1) + (h/2)), w(:,i-1) + k2/2);
    k4 = h.*f((t(i-1) + h), w(:,i-1) + k3);
    
    w(:,i) = w(:,i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
end
end