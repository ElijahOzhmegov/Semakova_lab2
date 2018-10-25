% ======================================================================
%                                task 3
% 
% Made by ElijahOzmegov@gmail.com as a part of the second laboratory work
% 
% Task is to transform a rotation matrix R to omega and theta, so 
% here will be used parts from the previous lab code
% As far as I understood my test version is 7, but I am not sure
% ======================================================================
clear omega R theta;

R = [0.0028 -0.0401  0.9992;
     0.8698 -0.4929 -0.0222;
     0.4934  0.8692  0.0335]; % provided

% R = [1 0 0; 0 -1 0; 0 0 -1]; % it was used to check the special case
 
theta = acos((trace(R) - 1)/2);
    
if (theta == pi)
    c0 = cos(theta);     % it's obvious that c0 = -1, but ...
    s0 = sin(theta);     % again it's s0 = 0
    v0 = 1 - cos(theta); % and again v0 = 2
                         % and I know there should be theta instead of '0'
                         
    syms omegaW Rij
	eqn = omegaW^2 * v0 + c0 == Rij; % why not
    
    sol = solve(eqn, omegaW);
    sol = matlabFunction(sol);
    
    omega = sol(R(1,1));
    
    if sol(R(1,1)) == 0
        omega = [omega sol(R(2,2)) sol(R(3,3))]; 
    else
        % as s0 = 0 when theta = pi, let us skip this part in equation
        syms restOmega omegaX
        eqn = restOmega * omegaX * v0 == Rij;
        
        sol = solve(eqn, omegaX);
        sol = matlabFunction(sol);
        
        omega = [omega sol(R(2,2), omega) sol(R(3,3), omega)]; 
        
    end
        
    clear sol c0 s0 v0 eqn omegaW Rij; 
    
elseif (theta ~= 0)
    omega = [R(3,2) - R(2,3);
             R(1,3) - R(3,1);
             R(2,1) - R(1,2)];

    omega = omega.' / (2*sin(theta));
end

disp('theta = ');
disp(theta);

if exist('omega', 'var')
    disp('omega = ');
    disp(omega);
else
    disp('omega is anything!');
end




