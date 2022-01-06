
function ReconnaissanceCouleurYCbCr()
nb_classe=50;%d�fini le nombre de classes 
nb_image=12;%d�fini le nombre d�images par classe 
nb_ima_train=6;%d�fini le nombre d�images d�apprentissage par classe 
nb_bins=4096*3;%d�fini la taille de l�histogramme des LBP consid�r� 
Attributs=zeros(nb_ima_train*nb_classe,nb_bins);

att_test=zeros(1,nb_bins);

%%Apprentisage 
disp(' La reconnaissance Couleur YCbCr (2,12) et le parametre de mapping classique:');
comp_train=1;
comp_test=1;
for i=1:nb_image*nb_classe
    if(mod(i,2)~=0) %les images impaires constituent les images d�apprentissage 
    %Enregistrement du num�ro de la classe dans un tableau 
    num_classe_train(comp_train)=floor((i-1)/nb_image)+1;
    %D�termination du num�ro de l�image 
    num_image=1+mod(i-1,12);%Concat�nation des cha�nes de caract�res 
    %pour constituer le chemin d�acc�s au fichier image
    if(num_image<10)
    fichier_train=['Base\' num2str(num_classe_train(comp_train)) '-0' num2str(num_image) '.jpg'];
    else
        fichier_train=['Base\' num2str(num_classe_train(comp_train)) '-' num2str(num_image) '.jpg'];
    end    
    %Ouverture de l�image 
    Ima_train=imread(fichier_train);
    
    %Conversion en niveaux de gris 
    Ima_train=rgb2ycbcr(Ima_train);
    
    %Extraction des attributs de texture
    Attributs(comp_train,:) = ExtractionLbpCouleur(Ima_train,2,12);
    comp_train=comp_train+1; 
    
    end
end

for i=1:nb_image*nb_classe
    if(mod(i,2)==0)
        num_classe_test(comp_test)=floor((i-1)/nb_image)+1;
        num_image=1+mod(i-1,12);
            if(num_image<10)
            fichier_test=['Base\' num2str(num_classe_test(comp_test)) '-0' num2str(num_image) '.jpg'];
            else
            fichier_test=['Base\' num2str(num_classe_test(comp_test)) '-' num2str(num_image) '.jpg'];
            end
        Ima_test=imread(fichier_test);
        Ima_test=rgb2ycbcr(Ima_test);
        att_test =ExtractionLbpCouleur(Ima_test,2,12);
            for j=1:nb_ima_train*nb_classe
                test(j)=histogram_intersection(Attributs(j,:),att_test);
            end
        [M,I] = max(test);
        classe = num_classe_train(I);
        classe_test(comp_test)=classe;
        comp_test=comp_test+1; 
    end
end
bien_classe = 0;
for i=1:300
    if(num_classe_train(i) == classe_test(i))
        bien_classe = bien_classe+1;
    end
end

taux = bien_classe/300
  
end
