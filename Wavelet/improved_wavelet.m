function f = improved_wavelet(x)
    [c,l]=wavedec2(x,2,'sym4');
    a1=uint8(wrcoef2('a',c,l,'sym4',2));
    [gc,gl]=wavedec2(a1,2,'coif2');
    n=[1,2]
    p=[10.28,24.08];
    % doing thresholding
    nc=wthcoef2('h',gc,gl,n,p,'s');
    nc=wthcoef2('v',gc,gl,n,p,'s');
    nc=wthcoef2('d',gc,gl,n,p,'s');
    mc=wthcoef2('h',gc,gl,n,p,'s');
    mc=wthcoef2('v',gc,gl,n,p,'s');
    mc=wthcoef2('d',gc,gl,n,p,'s');
    x2=waverec2(mc,gl,'coif2');
    f = medfilt2(x2,[5 5]);
    f=uint8(f);
end
