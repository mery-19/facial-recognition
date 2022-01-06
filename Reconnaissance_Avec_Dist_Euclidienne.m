function Reconnaissance_Avec_Dist_Euclidienne(R,N,mapping, nb_bins)

nb_classe=50;%d�fini le nombre de classes 
nb_image=12;%d�fini le nombre d�images par classe 
nb_ima_train=6;%d�fini le nombre d�images d�apprentissage par classe 
Attributs=zeros(nb_ima_train*nb_classe,nb_bins);
att_test=zeros(1,nb_bins);

%%Apprentisage 
comp_train=1;
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
    Ima_gray_train=rgb2gray(Ima_train);
    
    %Extraction des attributs de texture
    Attributs(comp_train,:) = LbpOfImage(Ima_gray_train,R,N,mapping,'h');
    comp_train=comp_train+1; 
    
    end
end

%Le taux de classification
tic
Test_Reconnaissance_Avec_Dist_Euclidienne(Attributs,num_classe_train,R,N,mapping)
toc   


end