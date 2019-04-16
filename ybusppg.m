% Program to for Admittance And Impedance Bus Formation....

function Y = ybusppg(num)  % Returns Y

lined = evalin('base','lined');      % Calling Linedatas...
fb = lined(:,1);             % From bus number...
tb = lined(:,2);             % To bus number...
r = lined(:,3);              % Resistance, R...
x = lined(:,4);              % Reactance, X...
b = lined(:,5);              % Ground Admittance, B/2...
a = lined(:,6);              % Tap setting value..



z = r + i*x;                    % z matrix...



y = 1./z;                       % To get inverse of each element...



b = i*b;                        % Make B imaginary...
assignin('base','z',z)
%nb = max(max(fb),max(tb))      % No. of buses...
nb=evalin('base','nbus');
%nb=14
nl = length(fb) ;               % No. of branches...
Y = zeros(nb,nb);               % Initialise YBus...
 

for t=1:nl
    if fb(t)==0
        nl=nl-1
    end
end
assignin('base','nl',nl);
assignin('base','nb',nb);
assignin('base','y',y);


 % Formation of the Off Diagonal Elements...
 for k = 1:nl
    
     Y(fb(k),tb(k)) =  - y(k)/a(k);
     Y(tb(k),fb(k)) = Y(fb(k),tb(k));
     
  
     
 end
 
 % Formation of Diagonal Elements....
 for m = 1:nb
     for n = 1:nl
         if fb(n) == m

             Y(m,m) = (Y(m,m) + y(n)/(a(n)^2) + b(n));
             
         elseif tb(n) == m
             Y(m,m) = (Y(m,m) + y(n)  + b(n));
           
         end
     end
 end
% Y;                  % Bus Admittance Matrix
 Z = inv(Y); % Bus Impedance Matrix
  
 assignin('base','Y',Y);
 assignin('base','Z',Z);
 
 