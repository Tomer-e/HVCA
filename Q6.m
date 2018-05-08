function Q6()

hold on
M1=GausSpot(128,10,[0,0]);
vals=[0];
for i=[1:64]
    M2=GausSpot(128,10,[i,0]);
    v_lk=Full_LK_alg(M1,M2,0,ones(128,128),1);
%     p=norm(v_lk-[i;i])^2;
    p=(v_lk(1)-i)^2+(v_lk(2)-0)^2;
    vals=[vals; p];
end
plot([0:64],vals)

M1=GausSpot(128,1,[0,0]);
vals2=[0];
for i=[1:64]
    M2=GausSpot(128,1,[i,0]);
    v_lk=Full_LK_alg(M1,M2,0,ones(128,128),1);
%     p=norm(v_lk-[i;i])^2;
    p=(v_lk(1)-i)^2+(v_lk(2)-0)^2;
    vals2=[vals2; p];
end

plot([0:64],vals2)
xlabel("velocity on x (0 on y)")
ylabel("SSD of velocities")
legend("sigma=10","sigma=1")
hold off
end

