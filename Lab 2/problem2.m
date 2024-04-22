% Regula Falsi Method Project 
% Gwendolyn Gorman
% Problem 3.9 

F= @ (x) x^3-x- exp(x)-2;
a= 2; b= 3; 
midpt= a-((b-a)/(F(b)-F(a)))*F(a);
while abs(F(midpt))>eps
    if F(a)*F(midpt)<0
        b=midpt;
    else
        a=midpt;
    end
    midpt= a-((b-a)/(F(b)-F(a)))*F(a);
end
fprintf('Iteration  a            b            f(xNS)\n');
disp(midpt);