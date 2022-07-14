function fettt=totalfeature(rgbim)
 fettt1=color_luv(rgbim);
 fettt2=edgehist(rgbim);
glcm=graycomatrix(rgb2gray(rgbim));
 fettt3=glcm(:);
 fettt=[fettt1;fettt2;fettt3];