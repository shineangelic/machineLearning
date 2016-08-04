function M=julia(zmin,zmax,hpx,niter,c)
  vpx=round(hpx*abs(imag(zmax-zmin)/real(zmax-zmin)));
  [zRe,zIm]=meshgrid(linspace(real(zmin),real(zmax),hpx),
                     linspace(imag(zmin),imag(zmax),vpx));
  z=zRe+i*zIm;
  M=zeros(vpx,hpx);
  for s=1:niter
    mask=abs(z)<2;
    M(mask)=M(mask)+1;
    z(mask)=z(mask).^2+c;
  endfor
  M(mask)=0;
endfunction