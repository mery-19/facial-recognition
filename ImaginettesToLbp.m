%Cette fonction retourne LBP de toutes les imagenettes (Concaténation)
%Question 16

function lbp_img=ImaginettesToLbp(image,rayon,nb_voisin)
[L,C,n] = size(image);
% nb_bins=4096*3*25;
lbp_img=[];

    %extraction des compsosnates RGB
    R=image(:,:,1);
    G=image(:,:,2);
    B=image(:,:,3);
    
    
    %division de l'images en 25 imaginettes
    i1=0;
    j1=0;
    for i=1:5
        j1=0;
        for j=1:5 
            I_R = R(i1+1:(L/5)*i,j1+1:(C/5)*j);
            I_G = G(i1+1:(L/5)*i,j1+1:(C/5)*j);
            I_B = B(i1+1:(L/5)*i,j1+1:(C/5)*j);
            
            %extraction lbp
            attribut_R=lbp(I_R,rayon,nb_voisin,0,'nh');
            attribut_G=lbp(I_G,rayon,nb_voisin,0,'nh');
            attribut_B=lbp(I_B,rayon,nb_voisin,0,'nh');


            %Stockage du lbp de chaque composante dans la variable attribut
            lbp_img=[lbp_img attribut_R attribut_G attribut_B];
            
            j1=j*(C/5);
        end
        i1=i*(L/5);
    end
end