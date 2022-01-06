%Cette fonctionne retourne le taux de test de la classification
%Attributs: Matrice contient LBP de chaque image train
%num_classe_train: Chaque ligne correspondant à la classe de l'image ayant
%meme numero de ligne dans la matrice attribut.
%exemple: Attributs(1,:) est LBP de l'image '1-01.jpg', et
%num_classe_train(1) est la classe de cette image

function taux = Test_Reconnaissance(Attributs,num_classe_train,R,N,mapping)
    nb_classe=50;
    nb_image=12;
    nb_ima_train=6;
    nb_ima_test=6;
    comp_test=1;

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
        Ima_gray_test=rgb2gray(Ima_test);
        %Pour chaque image test, on calcule LBP
        att_test = LbpOfImage(Ima_gray_test,R,N,mapping,'h');
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
    
    %Boucle pour calculer le nombre des images bien classés
    nb_total_images_test = nb_ima_test*nb_classe;
    for i=1:nb_total_images_test
        if(num_classe_train(i) == classe_test(i))
            bien_classe = bien_classe+1;
        end
    end
    taux = bien_classe/nb_total_images_test;
end