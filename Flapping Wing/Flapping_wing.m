clear all;
clc;
L1=40;x1=0;y1=0;
rho= [80:-1:41 41:1:79 79:-1:41 41:1:79 79:-1:40];
xlim([-150 300]);
ylim([-40 200]);
grid on;
for P = rho
        %% Points defenition with forward kinematics equation(sqrt((L1^2)-((P/2)^2) 
        E = (sqrt((L1^2)-((P/2)^2)));
        W1 = [((5*E)+(x1)) (y1+(3*(P/2)))];  
        W2 = [((-5*E)+(x1)) (y1+(3*(P/2)))];
        C = [x1 y1];
        A = [x1 (y1-(P))];
        B = [(x1+E) (y1-(P/2))];
        D = [(x1-E) (y1-(P/2))];
        
        %% Displays the value of point in each iteration
        strA = ['A', '(',num2str(A(1)),',', num2str(A(2)),')'];
        TXA = text(A(1)-20,A(2)-10,strA);
        
        strB = ['B', '(',num2str(B(1)),',', num2str(B(2)),')'];
        TXB = text(B(1)+10,B(2)-5,strB);
        
        strC = ['C', '(',num2str(C(1)),',', num2str(C(2)),')'];
        TXC = text(C(1)-20,C(2)+10,strC);
        
        strD = ['D', '(',num2str(D(1)),',', num2str(D(2)),')'];
        TXD = text(D(1)-110,D(2)-5,strD);
        
        strW1 = ['W1', '(',num2str(W1(1)),',', num2str(W1(2)),')'];
        TXW1 = text(W1(1)-60,W1(2)+20,strW1);
        
        strW2 = ['W2', '(',num2str(W2(1)),',', num2str(W2(2)),')'];
        TXW2 = text(W2(1)-60,W2(2)+20,strW2);
        
        %% Creating lines between the points
        CB = line([C(1) B(1)], [C(2) B(2)],'color','r','Linewidth',2);
        CA = line([C(1) A(1)], [C(2) A(2)],'color','r','linestyle','--');
        BA = line([B(1) A(1)], [B(2) A(2)],'color','r','Linewidth',2);
        AD = line([A(1) D(1)], [A(2) D(2)],'color','r','Linewidth',2);        
        DC = line([D(1) C(1)], [D(2) C(2)],'color','r','Linewidth',2);
        AW1 = line([A(1) W1(1)], [A(2) W1(2)],'color','r','Linewidth',2);
        AW2 = line([A(1) W2(1)], [A(2) W2(2)],'color','r','Linewidth',2);
        
        %% Creates hinged joints between the links
        H1 = plot(C(1),C(2),'ko','markerfacecolor','black');
        H2 = plot(A(1),A(2),'ko','markerfacecolor','black');
        H3 = plot(B(1),B(2),'ko','markerfacecolor','black');
        H4 = plot(D(1),D(2),'ko','markerfacecolor','black');
        H5 = plot(W1(1),W1(2),'ko','markerfacecolor','black');
        H6 = plot(W2(1),W2(2),'ko','markerfacecolor','black');   
        
        %% Rotational matrix with their values
        [A3,B3,C3,D3,S3] = Function_Rotation(20,2.5,P,x1,y1,40,1,-1,1,1,2,2,1);
        [A4,B4,C4,D4,S4] = Function_Rotation(20,2.5,P,x1,y1,40,1,1,1,-1,2,2,1);
        [A5,B5,C5,D5,S5] = Function_Rotation(100,4,P,x1,y1,40,-1,1,5,-1,2,2,-1);
        [A6,B6,C6,D6,S6] = Function_Rotation(100,4,P,x1,y1,40,-1,-1,5,1,2,2,-1); 
          
        pause(0.001);
        xlim([-250 250]);
        ylim([-100 150]); 
        grid on;
        if P>40
        delete(CB);delete(CA);
        delete(BA); 
        delete(AD); delete(DC);delete(AW1);delete(AW2);
        delete(H1); delete(H2); delete(H3); 
        delete(H4); delete(AW1); delete(AW2);
        delete(H1);delete(H2);delete(H3);delete(H4);delete(H5);delete(H6);
        delete(A3);delete(B3);delete(C3);delete(D3);delete(S3);
        delete(A4);delete(B4);delete(C4);delete(D4);delete(S4);
        delete(A5);delete(B5);delete(C5);delete(D5);delete(S5);
        delete(A6);delete(B6);delete(C6);delete(D6);delete(S6);
        delete(TXA);delete(TXB);delete(TXC);delete(TXD);delete(TXW1);delete(TXW2);
        hold on;
        end
end