f = @(x) (x^3 - x - exp(x) - 2);

% initial interval

 a = 2; b = 3; 

imax = 20; tol = 0.00001;
fa = f(a); fb = f(b);

% if a and b have same signs
if fa * fb > 0 
    fprintf('The function must have different signs at the end points a = %f and b = %f\n', a, b);
    return;
end

fprintf('Iteration  a            b            f(xNS)\n');
for i = 1 : imax
    % function of secant line passing thru (a, f(a)) and (b, f(b))
    % y = f(a) + [(f(b) - f(a)) / (b - a)] (x - a)
    % x-intercept: x = a - f(a) * (b - a) / (f(b) - f(a))
    midpt = a - f(a) * (b - a) / (f(b) - f(a));

    tmp = f(midpt);
    if abs(tmp) < tol
        fprintf('\nThe numerical solution is %f.\n', midpt);
        return;
    end

    if fa * tmp < 0
        b = midpt;
    else
        a = midpt;
    end
    fprintf('%5d %15.8f %12.8f %12.8f\n', i, a, b, tmp);
end

fprintf('\nToo many iterations are required.\n');
