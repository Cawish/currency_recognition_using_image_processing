function COL_FET=color_luv(rgb_im)
XYZ_TransFrm = makecform('srgb2xyz');
xyzI = applycform(rgb_im,XYZ_TransFrm);
warning('off');
LUVTRNS = makecform('xyz2uvl');
luvI = applycform(xyzI,LUVTRNS);

L=luvI(:,:,1);
U=luvI(:,:,2);
V=luvI(:,:,3);

 COL_FET(1)= mean(L(:));
 COL_FET(2) = std(L(:))^2;
 COL_FET(3)= skewness(L(:));
 COL_FET(4) = mean(U(:));
 COL_FET(5) = std(U(:))^2;
 COL_FET(6) = skewness(U(:));
 COL_FET(7) = mean(V(:));
 COL_FET(8) = std(V(:))^2;
 COL_FET(9) = skewness(V(:));

COL_FET=COL_FET';
end
