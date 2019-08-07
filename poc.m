
close all;
clear all;
pkg load image

fig1=double( rgb2gray(imread('ll.png')) );
fig2=double( rgb2gray(imread('rr.png')) );
figure(1); imagesc(fig1)
figure(2); imagesc(fig2)

PF1=fft2(fig1);
PF2=fft2(fig2);

den=abs(PF1.*PF2);

PhaseCorr=(PF1.*conj(PF2))./den;

result=ifft2(PhaseCorr);
result=log(abs(result).+1);

figure; imagesc(result)
