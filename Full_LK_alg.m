function [ v ] = Full_LK_alg(I1,I2 , lambda, mask, num_iterations)
%estimates v with LK algorithm
blur_1=blur_downsample(I1);
blur_2=blur_downsample(I2);
v_init=LK_alg(blur_1, blur_2 ,lambda,mask(1:2:size(mask,1),1:2:size(mask,2)),[0;0],1);
v=LK_alg(I1, I2 ,lambda,mask,2*v_init,num_iterations);
end

