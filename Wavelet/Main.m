% Read Image
i=imread('high.png');
i = rgb2gray(i);
figure(1)

% Adding gaussian noise to original image
i1=imnoise(i,'gaussian',0,0.01);
subplot(2,3,1);
imshow(i1);
title('gaussian noise');
% Use original wavelet
i1_pm = original_wavelet(i1);
subplot(2,3,4);
imshow(i1_pm);
title('gaussian noise after wavelet');


% Adding salt & pepper
i2 =imnoise(i,'salt & pepper',0.05);
subplot(2,3,2);
imshow(i2);
title('salt&pepper noise');
% Use original wavelet
i2_pm = original_wavelet(i2);
subplot(2,3,5);
imshow(i2_pm);
title('salt&pepper noise after wavelet');

% Adding speckle noise
i3 =imnoise(i,'speckle',0.04);
subplot(2,3,3);
imshow(i3);
title('speckle noise');
% Use original wavelet
i3_pm = original_wavelet(i3);
subplot(2,3,6);
imshow(i3_pm);
title('speckle noise after wavelet');
sgtitle('denoise with wavelet method')





figure(2)
% Adding gaussian noise to original image
subplot(2,3,1);
imshow(i1);
title('gaussian noise');
% Use improved wavelet
i1_pmi = improved_wavelet(i1);
subplot(2,3,4);
imshow(i1_pmi);
title('gaussian noise after improved wavelet method');


% Adding salt & pepper
subplot(2,3,2);
imshow(i2);
title('salt&pepper noise');
% Use improved wavelet
i2_pmi = improved_wavelet(i2);
subplot(2,3,5);
imshow(i2_pmi);
title('salt&pepper noise after improved wavelet method');

% Adding speckle noise
subplot(2,3,3);
imshow(i3);
title('speckle noise');
% Use Harr wvaelet
i3_pmi = improved_wavelet(i3);
subplot(2,3,6);
imshow(i3_pmi);
title('speckle noise after improved wavelet method');
sgtitle('denoise with improved wavelet method');

psnr1 = PSNRxb(i,i1_pmi)
psnr2 = PSNRxb(i,i2_pmi)
psnr3 = PSNRxb(i,i3_pmi)