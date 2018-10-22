% ======================================================================
%                                task 1
% 
% Made by ElijahOzmegov@gmail.com as a part of the second laboratory work
% 
% Task is to transform vector omega and angle theta to quaternion, so 
% here will be used parts from the previous lab code
% As far as I understood my test version is 7
% ======================================================================

omega = [0.1380 -0.8528 -0.5037]; % It was provided by the teacher
theta = 6.1800;                   %

% before calculation it was checked whether omega is unit vector or not
% via norm(omega)

if norm(omega) ~= 1
    omega = omega/norm(omega);
end

q_r = cos(theta/2);
q_i = omega(1)*sin(theta/2);
q_j = omega(2)*sin(theta/2);
q_k = omega(3)*sin(theta/2);

fprintf('q = %f + (%f)*i + (%f)*j + (%f)*k\n', q_r, q_i, q_j, q_k);