%% Theyagarajan_code
%% Rotational matrix as a function
% Rotational matrix with some added variable so that 
% it can be called as a function
function [T1,T2,T3,T4,S] = Function_Rotation(SZ1,SZ2,P,x1,y1,L1,M,T,I1,V1,V2,V3,V4)
%theta is calculated so that the 3D block rotates
%since it is called in another program variables are added in calulation
%for reducing the lines of the program
theta = T*acos((sqrt((L1^2)-((P/2)^2)))/(L1/1));
        Rotz = [cos(theta),-sin(theta);sin(theta),cos(theta)];
        %this centroid is calculated to fix the block in the desired position
        %since it is called in another program variables are added in calulation
        %for reducing the lines of the program
        EZ = (M*(sqrt((((L1*I1)/V2)^2)-((((P*I1)/V3)/2)^2))));
        Centroid = [(x1+(V1*(EZ))),((y1)-((V4)*(P/4)))];
        size = [SZ1,SZ2];
        A(1,1:2) = Rotz*[-size(1);-size(2)]; A(1,1) = A(1,1) + Centroid(1); A(1,2) = A(1,2) + Centroid(2);
        B(1,1:2) = Rotz*[-size(1);size(2)]; B(1,1) = B(1,1) + Centroid(1); B(1,2) = B(1,2) + Centroid(2);
        C(1,1:2) = Rotz*[size(1);-size(2)]; C(1,1) = C(1,1) + Centroid(1); C(1,2) = C(1,2) + Centroid(2);
        D(1,1:2) = Rotz*[size(1);size(2)]; D(1,1) = D(1,1) + Centroid(1); D(1,2) = D(1,2) + Centroid(2);
        T1 = plot([A(1,1),B(1,1)],[A(1,2),B(1,2)],'k','LineWidth',2);
        hold on;
        T2 = plot([A(1,1),C(1,1)],[A(1,2),C(1,2)],'k','LineWidth',2);
        T3 = plot([D(1,1),B(1,1)],[D(1,2),B(1,2)],'k','LineWidth',2);
        T4 = plot([D(1,1),C(1,1)],[D(1,2),C(1,2)],'k','LineWidth',2);
        S = scatter(Centroid(1),Centroid(2));
        
 end

        