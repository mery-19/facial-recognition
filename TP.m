
close all;
Image = imread('Base/1-01.jpg');
img2grey = rgb2gray(Image);
figure;

% LBP en variant le mode et le nombre des voisinages
% pour mode classique, u2, riu2, ri

% Mode classique
subplot(4,3,1);
lbp_1_8_classique = LbpOfImage(img2grey,1,8,0,'h');
subplot(4,3,2);
lbp_2_12_classique = LbpOfImage(img2grey,2,12,0,'h');
subplot(4,3,3);
lbp_4_16_classique = LbpOfImage(img2grey,4,16,0,'h');

%Paramétre mapping U2
subplot(4,3,4);
lbp_1_8_u2 = LbpOfImage(img2grey,1,8,'u2','h');
subplot(4,3,5);
lbp_2_12_u2 = LbpOfImage(img2grey,2,12,'u2','h');
subplot(4,3,6);
lbp_4_16_u2 = LbpOfImage(img2grey,4,16,'u2','h');

%Paramétre mapping riu2
subplot(4,3,7);
lbp_1_8_riu2 = LbpOfImage(img2grey,1,8,'riu2','h');
subplot(4,3,8);
lbp_2_12_riu2 = LbpOfImage(img2grey,2,12,'riu2','h');
subplot(4,3,9);
lbp_4_16_riu2  = LbpOfImage(img2grey,4,16,'riu2','h');

%Paramétre mapping ri
subplot(4,3,10);
lbp_1_8_ri  = LbpOfImage(img2grey,1,8,'ri','h');
subplot(4,3,11);
lbp_2_12_ri = LbpOfImage(img2grey,2,12,'ri','h');
subplot(4,3,12);
lbp_4_16_ri = LbpOfImage(img2grey,4,16,'ri','h');


