% Gwendolyn Gorman 
%
% Project 5: Euler's Method using predictor-corrector method
%

% defining x and y as symbolic variables 
sym x; 
sym y;
% defining y'
syms ydiff(x,y);
ydiff(x,y)=-1.2*y+y*exp(-0.3*x);
x_start = 0;
h=0.01;
x_end= 2;
y_start=3;
y_curr=y_start;

for x_curr=x_start:h:x_end-h
    %x value in current iteration
    % euler prediction formula 
    y_predicted =y_curr+h*eval(ydiff(x_curr,y_curr));
    %correction formula
    y_corrected = y_curr+h*(eval(ydiff(x_curr,y_curr))+eval(ydiff(x_curr+h,y_predicted)))/2; 
  %x_curr=x_curr+h
    y_curr=y_corrected;
end
fprintf('The value of y(%d) is  %.5f',x_end,y_curr)