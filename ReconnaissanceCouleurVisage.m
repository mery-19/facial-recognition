nb_classe=50;
nb_image=12;
nb_ima_train=6;
nb_bins=4096*3;
Attributs=zeros(nb_ima_train*nb_classe,nb_bins);

att_test=zeros(1,nb_bins);

%%Apprentisage 
tic
disp(' La ReconnaissanceCouleurVisage le temps de (2,12) et le parametre de mapping classique:');
comp_train=1;
comp_test=1;
for i=1:nb_image*nb_classe
    if(mod(i,2)~=0)
    num_classe_train(comp_train)=floor((i-1)/nb_image)+1;
    num_image=1+mod(i-1,12);
    if(num_image~=1&&num_image~=9)
    if(num_image<10)
    fichier_train=['NvBase\' num2str(num_classe_train(comp_train)) '-0' num2str(num_image) '.jpg'];
    else
        fichier_train=['NvBase\' num2str(num_classe_train(comp_train)) '-' num2str(num_image) '.jpg'];
    end

    Ima_train=imread(fichier_train);
    Ima_train=rgb2ntsc(Ima_train);%Espace YIQ

    Attributs(comp_train,:) = ExtractionLbpCouleurVisage(Ima_train,2,12);
    comp_train=comp_train+1; 
    end
    end
end

for i=1:nb_image*nb_classe
    if(mod(i,2)==0)
        num_classe_test(comp_test)=floor((i-1)/nb_image)+1;
        num_image=1+mod(i-1,12);
        if(num_image~=2&&num_image~=10)
            if(num_image<10)
            fichier_test=['NvBase\' num2str(num_classe_test(comp_test)) '-0' num2str(num_image) '.jpg'];
            else
            fichier_test=['NvBase\' num2str(num_classe_test(comp_test)) '-' num2str(num_image) '.jpg'];
            end
        
        Ima_test=imread(fichier_test);
        Ima_test=rgb2ntsc(Ima_test); %Espace YIQ
        att_test =ExtractionLbpCouleurVisage(Ima_test,2,12);
            for j=1:nb_ima_train*nb_classe
                test(j)=histogram_intersection(Attributs(j,:),att_test);
            end
        [M,I] = max(test);
        classe = num_classe_train(I);
        classe_test(comp_test)=classe;
        comp_test=comp_test+1; 
        end
    end
end
bien_classe = 0;
for i=1:200
    if(num_classe_train(i) == classe_test(i))
        bien_classe = bien_classe+1;
    end
end

taux = bien_classe/200
toc   
