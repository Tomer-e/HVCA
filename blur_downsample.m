function [Im] = blur_downsample( I )
%get an image I and blur+downsample it
load('GaussKernel.mat');
Im=conv2(I,GaussKernel,'same');
Im=Im(1:2:size(Im,1),1:2:size(Im,2));
end

