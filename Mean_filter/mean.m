clc
clear
Img0=imread('high.png');
Img0 = rgb2gray(Img0);
PSF=fspecial('motion',3);
gb=imfilter(Img0,PSF,'circular');
Img=imnoise(gb,'gaussian',0,0.01);
%Img=imnoise(gb,'salt & pepper',0.05);
%Img=imnoise(gb,'speckle',0.04);
Img=double(Img);
Img_gaussian_0=Img;

Img_gaussian_1 = imfilter(Img_gaussian_0, fspecial('average'));

f1 = Img_gaussian_1;
f2 = gb;
% f3=image_gaosi_noise;

k = 8;

fmax = 2.^k - 1;
a = fmax.^2;
e = double(f1) - double(f2);
% e1=double(f3) - double(f2);
[m, n] = size(e);
b =sum( sum(e.^2))
% b =sum( sum(e.^2))
Pgaussian = 10*log10(m*n*a/b)

%---------------------------------------------------%
Img0=imread('high.png');
Img0 = rgb2gray(Img0);
PSF=fspecial('motion',3);
gb=imfilter(Img0,PSF,'circular');
%Img=imnoise(gb,'gaussian',0,0.01);
Img=imnoise(gb,'salt & pepper',0.05);
%Img=imnoise(gb,'speckle',0.04);
Img=double(Img);
Img_salt_0=Img;

Img_salt_1 = imfilter(Img_salt_0, fspecial('average'));

f1 = Img_salt_1;
f2 = gb;
% f3=image_gaosi_noise;
k = 8;

fmax = 2.^k - 1;
a = fmax.^2;
e = double(f1) - double(f2);
% e1=double(f3) - double(f2);
[m, n] = size(e);
b =sum( sum(e.^2))
% b =sum( sum(e.^2))
Psalt = 10*log10(m*n*a/b)

%----------------------------------------%

Img0=imread('high.png');
Img0 = rgb2gray(Img0);
PSF=fspecial('motion',3);
gb=imfilter(Img0,PSF,'circular');
%Img=imnoise(gb,'gaussian',0,0.01);
%Img=imnoise(gb,'salt & pepper',0.05);
Img=imnoise(gb,'speckle',0.04);
Img=double(Img);
Img_speckle_0=Img;

Img_speckle_1 = imfilter(Img_speckle_0, fspecial('average'));

f1 = Img_speckle_1;
f2 = gb;
% f3=image_gaosi_noise;

k = 8;

fmax = 2.^k - 1;
a = fmax.^2;
e = double(f1) - double(f2);
% e1=double(f3) - double(f2);
[m, n] = size(e);
b =sum( sum(e.^2))
% b =sum( sum(e.^2))
Pspeckle = 10*log10(m*n*a/b)


%----------------------------------------%
Img_gaussian_0=mat2gray(Img_gaussian_0);
Img_gaussian_1=mat2gray(Img_gaussian_1);
Img_salt_0=mat2gray(Img_salt_0);
Img_salt_1=mat2gray(Img_salt_1);
Img_speckle_0=mat2gray(Img_speckle_0);
Img_speckle_1=mat2gray(Img_speckle_1);

 figure(1);
 subplot(2,3,1);
 imshow(Img_gaussian_0);
 title('gaussian noise');
 subplot(2,3,4);
 imshow(Img_gaussian_1);
 title('gaussian noise after mean filter');
 subplot(2,3,2);
 imshow(Img_salt_0);
 title('salt&pepper noise');
 subplot(2,3,5);
 imshow(Img_salt_1);
 title('salt&pepper noise after mean filter');
 subplot(2,3,3);
 imshow(Img_speckle_0);
 title('speckle noise');
 subplot(2,3,6);
 imshow(Img_speckle_1);
 title('speckle noise after mean filter');
 suptitle('denoise with mean filter');
