% ======================================================================
%                                task 3
% 
% Made by ElijahOzmegov@gmail.com as a part of the second laboratory work
% 
% Task is to transform a rotation matrix R to omega and theta, so 
% here will be used parts from the previous lab code
% As far as I understood my test version is 7, but I am not sure
% ======================================================================

R = [0.0028 -0.0401  0.9992;
     0.8698 -0.4929 -0.0222;
     0.4934  0.8692  0.0335]; % provided
 
theta = acos((trace(R) - 1)/2);
 
if theta == 0
    disp('theta is zero, so');
    disp('omega is anything!');
        
else
    omega = [R(3,2) - R(2,3);
             R(1,3) - R(3,1);
             R(2,1) - R(1,2)];

    omega = omega / (2*sin(theta));
    
%     if (thera == pi)
%         c0 = cos(theta);     % it's obvious that c0 = -1, but ...
%         s0 = sin(theta);     % again
%         v0 = 1 - cos(theta); % and again
%                              % and I know there is theta instead of '0'
%         
%         omS = omega(1);
%         omX = omega(2);
%         omY = omega(3);
%         omZ = omega(4);
%         
%         R = [omX^2*v0 + c0, omX*omY*v0 - omX*s0, omX*omS*v0 + omY*s0];
%     end

    fprintf(' omegaX = %f\n omegaY = %f\n omegaZ = %f\n theta  = %f\n', ...
        omega(1), omega(2), omega(3), theta);
end








