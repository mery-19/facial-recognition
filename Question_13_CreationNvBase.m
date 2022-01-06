%On construit une nouvelle base d’images correspondant aux images de la base initiale
%Les images sont centrées et rognées pour ne considérer que le visage de la personne.
%Avant de d'éxecuter ce fichier, créer un dossier "NvBase"

clear all;
close all;
clc;
nb_classe=50;
nb_image=12;
comp=1;
faceDetector = vision.CascadeObjectDetector;

disp('Hi');
for i=1:nb_image*nb_classe
        num_classe(comp)=floor((i-1)/nb_image)+1;
        num_image=1+mod(i-1,12);
        if(num_image~=1&&num_image~=2&&num_image~=9&&num_image~=10)
            if(num_image<10)
                fichier=['Base\' num2str(num_classe(comp)) '-0' num2str(num_image) '.jpg'];
                nvfichier=['NvBase\' num2str(num_classe(comp)) '-0' num2str(num_image) '.jpg'];
            else
               fichier=['Base\' num2str(num_classe(comp)) '-' num2str(num_image) '.jpg'];
               nvfichier=['NvBase\' num2str(num_classe(comp)) '-' num2str(num_image) '.jpg'];
            end
            Ima=imread(fichier);
            bboxes = step(faceDetector, Ima);
            [L,~]=size(bboxes);
            if(L>1)
                I=imcrop(Ima,bboxes(2,:));
            else
                I=imcrop(Ima,bboxes);   
            end
            imwrite(I,nvfichier);
        end
    comp=comp+1;
end
disp('By');