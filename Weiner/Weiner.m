% Read Image
i=imread('high.png');
i = rgb2gray(i);
i1=imnoise(i,'gaussian',0,0.01);
i2 =imnoise(i,'salt & pepper',0.05);
i3 =imnoise(i,'speckle',0.04);

% 5*5 weiner filter
i1_p = wiener2(i1,[5 5]);
i2_p = wiener2(i2,[5 5]);
i3_p = wiener2(i3,[5 5]);

subplot(2, 3, 1), imshow(i1), title('gaussian noise');
subplot(2, 3, 4), imshow(i1_p), title('gaussian noise after weiner filter');
subplot(2, 3, 2), imshow(i2), title('salt&pepper noise');
subplot(2, 3, 5), imshow(i2_p), title('salt&pepper noise after weiner filter');
subplot(2, 3, 3), imshow(i3), title('speckle noise');
subplot(2, 3, 6), imshow(i3_p), title('speckle noise after weiner filter');
sgtitle('denoise with Weiner filter')
psnr1 = PSNRxb(i,i1_p)
psnr2 = PSNRxb(i,i2_p)
psnr3 = PSNRxb(i,i3_p)
