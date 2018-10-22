% ======================================================================
%                                task 2
% 
% Made by ElijahOzmegov@gmail.com as a part of the second laboratory work
% 
% Task is to transform a quaternion to a rotation matrix R, so 
% here will be used parts from the previous lab code
% As far as I understood my test version is 7, but I am not sure
% ======================================================================

q = [0.6442 -0.5851 -0.3146 0.3791]; % It was provided by the teacher

% before calculation it was checked whether quaternion is unit one or not
% via norm(quaternion), but actually it is not necessary, because we can 
% use s = ||q||^-2 in R matrix calculation

if norm(q) ~= 1
    q = q/norm(q);
end

q_r = q(1);
q_i = q(2);
q_j = q(3);
q_k = q(4);

R = [1 - 2*(q_j^2 + q_k^2) 2*(q_i*q_j - q_k*q_r) 2*(q_i*q_k + q_j*q_r);
     2*(q_i*q_j + q_k*q_r) 1 - 2*(q_i^2 + q_k^2) 2*(q_j*q_k - q_i*q_r);
     2*(q_i*q_k - q_j*q_r) 2*(q_j*q_k + q_i*q_r) 1 - 2*(q_i^2 + q_j^2)];

disp('Here rotation matrix:')
disp(R);