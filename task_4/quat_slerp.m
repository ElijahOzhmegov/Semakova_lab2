function [ q_int ] = quat_slerp( q0, q1, steps )
%QUAT_SLERP Perform SLERP between two quaternions and return the intermediate quaternions
%   Usage: [ q_int ] = quat_slerp( q0, q1, steps )
%   Inputs:
%       q0 is the quaternion representing the starting orientation, 1x4 matrix
%       q1 is the quaternion representing the final orientation, 1x4 matrix
%       steps is the number of intermediate quaternions required to be returned, integer value
%       The first step is q0, and the last step is q1
%   Output:
%       q_int contains q0, steps-2 intermediate quaternions, q1
%       q_int is a (steps x 4) matrix

    q_int = zeros(steps, 4);
    
    Omega = quat_multiply(q0 , q1);
    Omega = acos(Omega);
    
    counterClockwise = 1;
    if Omega(1) > pi/2
         counterClockwise = -1;
    end
    
    i = 1;
    for t=0:1/steps:1
        q_int(i,:) = sin((1 - t)*Omega)/sin(Omega) * q0 + ...
                        counterClockwise*sin(t*Omega)/sin(Omega) * q1;
        q_int(i,:) = q_int(i,:)/norm(q_int(i,:));
        i = i + 1;
    end
    
    
end