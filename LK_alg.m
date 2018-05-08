function [v] = LK_alg( I1, I2 ,lambda, mask,v_initial,num_iterations)
%lucas kanade algorithm implementation
cur_mask=mask;
v_prev=v_initial;
lambda_I=diag([lambda,lambda]);
for i = 1:num_iterations
    [I2w,mask_w]=warp(I2,v_prev);
    cur_mask=cur_mask.*mask_w;
    [Ix, Iy, It] = ImageDerivatives( I1.*cur_mask, I2w.*cur_mask );
    
    xy=sum(sum(Ix.*Iy));
    M=[sum(sum(Ix.^2))+lambda,xy;xy,sum(sum(Iy.^2)+lambda)];
    b=-[sum(sum(Ix.*It));sum(sum(Iy.*It))];
%     A=M+lambda_I;
    v_prev=v_prev+(inv(M)*b);
end
v=v_prev;
end

