function [ Ix, Iy, It ] = ImageDerivatives( im1, im2 )
%calculate the derivatives in the x, y and time
Ky=0.25*[-1 -1;1 1];
Kx=0.25*[1 -1;1 -1];
Kt=0.25*[1 1;1 1];
Ix=conv2(im1,Kx,'same') +conv2(im2,Kx,'same');
Iy=conv2(im1,Ky,'same') +conv2(im2,Ky,'same');
It=conv2(im2,Kt,'same') -conv2(im1,Kt,'same');

end

