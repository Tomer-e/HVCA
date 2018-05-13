function  v_lk = Q7()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

fatFlag=0;
if (fatFlag==1)
    theta1=0;
    theta2=45;
else
    theta1=30;
    theta2=45;
end

hold on
x=[-2:2];
y1=x*tand(theta1);
y2=x*tand(theta2);
plot(x,y1,'b')
plot(x,y2,'r')
plot(x+1,y1,'--b')
plot(x+1,y2,'--r')

% % % % % % % IOC
p1 = polyfit(x+1,y1,1);
p2 = polyfit(x+1,y2,1);
%calculate intersection
x_intersect = fzero(@(x) polyval(p1-p2,x),3);
y_intersect = polyval(p1,x_intersect);
plot(x_intersect,y_intersect,'om');

% % % %  VA

v1_size=cosd(theta1-90);
if theta1==0
    v1_dir=[0,1];
else
    v1_dir=[1,tand(theta1-90)];
end
v1=v1_size*v1_dir/norm(v1_dir);

v2_size=cosd(theta2-90);
v2_dir=[1,tand(theta2-90)];
v2=v2_size*v2_dir/norm(v2_dir);

va=(v1+v2)/2
plot(va(1),va(2),'oc')


legend('line 1','line 2','constraint 1','constraint 2','IOC','VA')

for i = [0,0.01,0.1,0.5,1]
    [M1,M2]=rhombusMovie(fatFlag,i);
     v_lk=Full_LK_alg(M1,M2,0.01,ones(size(M1)),1);
     plot(v_lk(1),v_lk(2),'s','DisplayName',strcat('contrast=', num2str(i)))
     
%      mymovie(M1,M2)    
end
% plot([0:64],vals2)
% xlabel("velocity on x (0 on y)")
% ylabel("SSD of velocities")
% legend("sigma=10","sigma=1")
hold off
end


