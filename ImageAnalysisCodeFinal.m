% Image Analysis Code
% 
% By Jeevan Singh Bhoot - 10/08/2018
%
% This code will analyse five strips at once, finding the number of
% striations, wavelength, spanwise wavelength, standard deviation and
% absolute uncertainity in the number of striations counted, for each
% strip. 
% Please see the bottom of the code for important notes.
%
% Parameters required for each image:
lp = size(S1,1);
wp = size(S1,2);
r = [1/12 1/12 1/12 1/12 1/12 1/12 1/12 1/12 1/12 1/12 1/12 1/12];
ratiolength = 0.0000814814814814815;
D = 0.152;
q = 1;
l = ratiolength*lp;
%
% Strip one:
I1x = im2double(S1);
I1y = rgb2gray(I1x);
st_dev_1 = std(I1y(:));
abs_unc_1 = 1.96*st_dev_1/sqrt(wp);
a1 = mean(I1y,2);
x1 = a1(:,1);
s1 = filter(r,q,x1);
n1 = numel(findpeaks(s1));
lambda1 = l/n1;
lambda_over_D1 = lambda1/D;
%
% Strip two:
I2x = im2double(S2);
I2y = rgb2gray(I2x);
st_dev_2 = std(I2y(:));
abs_unc_2 = 1.96*st_dev_2/sqrt(wp);
a2 = mean(I2y,2);
x2 = a2(:,1);
s2 = filter(r,q,x2);
n2 = numel(findpeaks(s2));
lambda2 = l/n2;
lambda_over_D2 = lambda2/D;
%
% Strip three:
I3x = im2double(S3);
I3y = rgb2gray(I3x);
st_dev_3 = std(I3y(:));
abs_unc_3 = 1.96*st_dev_3/sqrt(wp);
a3 = mean(I3y,2);
x3 = a3(:,1);
s3 = filter(r,q,x3);
n3 = numel(findpeaks(s3));
lambda3 = l/n3;
lambda_over_D3 = lambda1/D;
%
% Strip four:
I4x = im2double(S4);
I4y = rgb2gray(I4x);
st_dev_4 = std(I4y(:));
abs_unc_4 = 1.96*st_dev_4/sqrt(wp);
a4 = mean(I4y,2);
x4 = a4(:,1);
s4 = filter(r,q,x4);
n4 = numel(findpeaks(s4));
lambda4 = l/n4;
lambda_over_D4 = lambda4/D;
%
% Strip five:
I5x = im2double(S5);
I5y = rgb2gray(I5x);
st_dev_5 = std(I5y(:));
abs_unc_5 = 1.96*st_dev_5/sqrt(wp);
a5 = mean(I5y,2);
x5 = a5(:,1);
s5 = filter(r,q,x5);
n5 = numel(findpeaks(s5));
lambda5 = l/n5;
lambda_over_D5 = lambda5/D;
%
% Notes:
% Please name the 5 strips as S1, S2, S3, S4 and S5, and ensure that
% they are in the .tiff file format, for optimal results. The only values
% that must be altered are 'r' and 'ratiolength'. 'r' is used for the
% moving average filter: the values for 'r' must add up to one and as the
% number of numerical values increases, the intensity of the moving average
% filter increases. Experiment with the values to find the most suitable
% filter for your specific images. 'ratiolength' is the ratio of one pixel
% to the actual length in metres. This can be found by measuring the length
% of the A4 sheet in your original photograph in pixels, by using
% Photoshop, and then dividing 0.297 by the value you measured.