% A function to solve equations which coefficients have form of penta
% diagonal matrix with band b
 
function x=penta_diagonal(A,b)
 
[M,N]=size(A);
% Dimension checking
 
if M~=N
    
    error('Matrix must be square');
    
end
 
if length(b)~=M
    
    error('Matrix and vector must have the same number of rows');
    
end
 
x=zeros(N,1);
    
 
if A==A'    % Matrix symmetry checking
    
    % Band Extractions
    
    d=diag(A);
    f=diag(A,1);
    e=diag(A,2);
    
    disp(d);
    disp(f);
    disp(e);
        
    alpha=zeros(N,1);
    gamma=zeros(N-1,1);
    delta=zeros(N-2,1);
    c=zeros(N,1);
    z=zeros(N,1);
    
    % Factor A=LDL'
    
    alpha(1)=d(1);
    gamma(1)=f(1)/alpha(1);
    delta(1)=e(1)/alpha(1);
    
    alpha(2)=d(2)-f(1)*gamma(1);
    gamma(2)=(f(2)-e(1)*gamma(1))/alpha(2);
    delta(2)=e(2)/alpha(2);
    
    for k=3:N-2
        
        alpha(k)=d(k)-e(k-2)*delta(k-2)-alpha(k-1)*gamma(k-1)^2;
        gamma(k)=(f(k)-e(k-1)*gamma(k-1))/alpha(k);
        delta(k)=e(k)/alpha(k);
    end
    
    alpha(N-1)=d(N-1)-e(N-3)*delta(N-3)-alpha(N-2)*gamma(N-2)^2;
    gamma(N-1)=(f(N-1)-e(N-2)*gamma(N-2))/alpha(N-1);
    alpha(N)=d(N)-e(N-2)*delta(N-2)-alpha(N-1)*gamma(N-1)^2;
    
    % Updating Lx=b, Dc=z
    
    z(1)=b(1);
    z(2)=b(2)-gamma(1)*z(1);
    
    for k=3:N
        z(k)=b(k)-gamma(k-1)*z(k-1)-delta(k-2)*z(k-2);
    end
    
    c=z./alpha;
        
    % Back Substitution L'x=c
    
    x(N)=c(N);
    x(N-1)=c(N-1)-gamma(N-1)*x(N);
    
    for k=N-2:-1:1
        
        x(k)=c(k)-gamma(k)*x(k+1)-delta(k)*x(k+2);
    end  
   
end
 
x;
end