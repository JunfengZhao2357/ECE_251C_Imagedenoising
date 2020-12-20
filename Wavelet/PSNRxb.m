function PSNR1 = PSNRxb(f1,f2)
    %calculate PSNR
    k = 8;
    fmax = 2.^k - 1;
    a = fmax.^2;
    e = double(f1) - double(f2);
    [m, n] = size(e);
    b =sum( sum(e.^2));
    PSNR1 = 10*log10(m*n*a/b)
end
