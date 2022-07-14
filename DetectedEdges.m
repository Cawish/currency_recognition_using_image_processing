function im2= DetectedEdges(rgb_im)


new_im=rgb2ycbcr(rgb_im);

y=double(new_im(:,:,1));
Feature1 = zeros(3,3,5);
Feature1(:,:,1) = [1 2 1;0 0 0;-1 -2 -1]; %vertical
Feature1(:,:,2) = [-1 0 1;-2 0 2;-1 0 1];   %horizontal
Feature1(:,:,3) = [2 2 -1;2 -1 -1; -1 -1 -1];% 45 diagonal
Feature1(:,:,4) = [-1 2 2; -1 -1 2; -1 -1 -1];%135 diagonal
Feature1(:,:,5) = [-1 0 1;0 0 0;1 0 -1]; % non directional

for i = 1:5
g_im(:,:,i) = filter2(Feature1(:,:,i),y);
end
[m, p] = max(g_im,[],3);
edim = edge(y, 'canny');
im2 =(p.*edim);

end