% Regula Falsi Method Project 
% Gwendolyn Gorman
% Problem 3.7 

F= @ (x) 1.2*x^3 + 2*x^2- 20*x - 10;
a= -4; b= -5; 
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