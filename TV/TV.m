clc
clear
Img0=imread('high.png');%读取图片
Img0 = rgb2gray(Img0);
PSF=fspecial('motion',3);%创建PSF
gb=imfilter(Img0,PSF,'circular');%创建退化图像
Img=imnoise(gb,'gaussian',0,0.01);%加高斯噪声
%Img=imnoise(gb,'salt & pepper',0.05);%加椒盐噪声
%Img=imnoise(gb,'speckle',0.04);%加乘性噪声

%imshow(Img)
Img=double(Img);
Img_gaussian_0=Img;

Img0=Img;

[ny,nx]=size(Img); % 获取图像尺寸大小
ep=1;
ep2=ep^2;        % 定义ep2
lam=0.023;
dt=0.5;
for i = 1:20  %迭代
   % 中心差法计算梯度和微分
   % WN  N  EN
   % W   O  E 
   % WS  S  ES
   I_x = (Img(:,[2:nx nx])-Img(:,[1 1:nx-1]))/2;  % Ix = (E-W)/2
   I_y = (Img([2:ny ny],:)-Img([1 1:ny-1],:))/2;  % Iy = (S-N)/2
   I_xx = Img(:,[2:nx nx])+Img(:,[1 1:nx-1])-2*Img; % Ixx = E+W-2*O
   I_yy = Img([2:ny ny],:)+Img([1 1:ny-1],:)-2*Img; % Iyy = S+N-2*O
   Dp = Img([2:ny ny],[2:nx nx])+Img([1 1:ny-1],[1 1:nx-1]);
   Dm = Img([1 1:ny-1],[2:nx nx])+Img([2:ny ny],[1 1:nx-1]);
   I_xy = (Dp-Dm)/4;                          % Ixy = Iyx = ((ES+WN)-(EN+WS))/4
   
 
   Num = I_xx.*(ep2+I_y.^2)-2*I_x.*I_y.*I_xy+I_yy.*(ep2+I_x.^2);
   Den = (ep2+I_x.^2+I_y.^2).^(3/2);
   
   % 计算I_t
   I_t = Num./Den + lam.*(Img0-Img);
   %梯度下降法迭代求解PDE(扩散)
   Img=Img+dt*I_t; 
end
Img_gaussian_1=Img;
%figure
%Img4=mat2gray(Img);
%imshow(Img4)
% 计算PSNR

f1 = Img_gaussian_1;
f2 = gb;
% f3=image_gaosi_noise;
%计算两幅图像的峰值信噪比
k = 8;
%k为图像时表示单个像素点所用的二进制位数，即位深。
fmax = 2.^k - 1;
a = fmax.^2;
e = double(f1) - double(f2);
% e1=double(f3) - double(f2);
[m, n] = size(e);
b =sum( sum(e.^2))
% b =sum( sum(e.^2))
Pgaussian = 10*log10(m*n*a/b)

%--------------------------------------%

Img0=imread('high.png');%读取图片
Img0 = rgb2gray(Img0);
PSF=fspecial('motion',3);%创建PSF
gb=imfilter(Img0,PSF,'circular');%创建退化图像
%Img=imnoise(gb,'gaussian',0,0.01);%加高斯噪声
Img=imnoise(gb,'salt & pepper',0.05);%加椒盐噪声
%Img=imnoise(gb,'speckle',0.04);%加乘性噪声

%imshow(Img)
Img=double(Img);
Img_salt_0=Img;

Img0=Img;

[ny,nx]=size(Img); % 获取图像尺寸大小
ep=1;
ep2=ep^2;        % 定义ep2
lam=0.023;
dt=0.5;
for i = 1:20  %迭代
   % 中心差法计算梯度和微分
   % WN  N  EN
   % W   O  E 
   % WS  S  ES
   I_x = (Img(:,[2:nx nx])-Img(:,[1 1:nx-1]))/2;  % Ix = (E-W)/2
   I_y = (Img([2:ny ny],:)-Img([1 1:ny-1],:))/2;  % Iy = (S-N)/2
   I_xx = Img(:,[2:nx nx])+Img(:,[1 1:nx-1])-2*Img; % Ixx = E+W-2*O
   I_yy = Img([2:ny ny],:)+Img([1 1:ny-1],:)-2*Img; % Iyy = S+N-2*O
   Dp = Img([2:ny ny],[2:nx nx])+Img([1 1:ny-1],[1 1:nx-1]);
   Dm = Img([1 1:ny-1],[2:nx nx])+Img([2:ny ny],[1 1:nx-1]);
   I_xy = (Dp-Dm)/4;                          % Ixy = Iyx = ((ES+WN)-(EN+WS))/4
   
 
   Num = I_xx.*(ep2+I_y.^2)-2*I_x.*I_y.*I_xy+I_yy.*(ep2+I_x.^2);
   Den = (ep2+I_x.^2+I_y.^2).^(3/2);
   
   % 计算I_t
   I_t = Num./Den + lam.*(Img0-Img);
   %梯度下降法迭代求解PDE(扩散)
   Img=Img+dt*I_t; 
end
Img_salt_1=Img;
%figure
%Img4=mat2gray(Img);
%imshow(Img4)
% 计算PSNR

f1 = Img_salt_1;
f2 = gb;
% f3=image_gaosi_noise;
%计算两幅图像的峰值信噪比
k = 8;
%k为图像时表示单个像素点所用的二进制位数，即位深。
fmax = 2.^k - 1;
a = fmax.^2;
e = double(f1) - double(f2);
% e1=double(f3) - double(f2);
[m, n] = size(e);
b =sum( sum(e.^2))
% b =sum( sum(e.^2))
Psalt = 10*log10(m*n*a/b)

%--------------------------------------%

Img0=imread('high.png');%读取图片
Img0 = rgb2gray(Img0);
PSF=fspecial('motion',3);%创建PSF
gb=imfilter(Img0,PSF,'circular');%创建退化图像
%Img=imnoise(gb,'gaussian',0,0.01);%加高斯噪声
%Img=imnoise(gb,'salt & pepper',0.05);%加椒盐噪声
Img=imnoise(gb,'speckle',0.04);%加乘性噪声

%imshow(Img)
Img=double(Img);
Img_speckle_0=Img;

Img0=Img;

[ny,nx]=size(Img); % 获取图像尺寸大小
ep=1;
ep2=ep^2;        % 定义ep2
lam=0.023;
dt=0.5;
for i = 1:20  %迭代
   % 中心差法计算梯度和微分
   % WN  N  EN
   % W   O  E 
   % WS  S  ES
   I_x = (Img(:,[2:nx nx])-Img(:,[1 1:nx-1]))/2;  % Ix = (E-W)/2
   I_y = (Img([2:ny ny],:)-Img([1 1:ny-1],:))/2;  % Iy = (S-N)/2
   I_xx = Img(:,[2:nx nx])+Img(:,[1 1:nx-1])-2*Img; % Ixx = E+W-2*O
   I_yy = Img([2:ny ny],:)+Img([1 1:ny-1],:)-2*Img; % Iyy = S+N-2*O
   Dp = Img([2:ny ny],[2:nx nx])+Img([1 1:ny-1],[1 1:nx-1]);
   Dm = Img([1 1:ny-1],[2:nx nx])+Img([2:ny ny],[1 1:nx-1]);
   I_xy = (Dp-Dm)/4;                          % Ixy = Iyx = ((ES+WN)-(EN+WS))/4
   
 
   Num = I_xx.*(ep2+I_y.^2)-2*I_x.*I_y.*I_xy+I_yy.*(ep2+I_x.^2);
   Den = (ep2+I_x.^2+I_y.^2).^(3/2);
   
   % 计算I_t
   I_t = Num./Den + lam.*(Img0-Img);
   %梯度下降法迭代求解PDE(扩散)
   Img=Img+dt*I_t; 
end
Img_speckle_1=Img;
%figure
%Img4=mat2gray(Img);
%imshow(Img4)
% 计算PSNR

f1 = Img_speckle_1;
f2 = gb;
% f3=image_gaosi_noise;
%计算两幅图像的峰值信噪比
k = 8;
%k为图像时表示单个像素点所用的二进制位数，即位深。
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
 title('gaussian noise after TV');
 subplot(2,3,2);
 imshow(Img_salt_0);
 title('salt&pepper noise');
 subplot(2,3,5);
 imshow(Img_salt_1);
 title('salt&pepper noise after TV');
 subplot(2,3,3);
 imshow(Img_speckle_0);
 title('speckle noise');
 subplot(2,3,6);
 imshow(Img_speckle_1);
 title('speckle noise after TV');
 suptitle('denoise with TV');
