function  v_lk = Q7()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


for i = [0:0.5:1]
    [M1,M2]=rhombusMovie(1,i);
     v_lk=Full_LK_alg(M1,M2,0,ones(size(M1)),0.01);
    mymovie(M1,M2)

end
hold on
% plot([0:64],vals2)
% xlabel("velocity on x (0 on y)")
% ylabel("SSD of velocities")
% legend("sigma=10","sigma=1")
hold off
end


