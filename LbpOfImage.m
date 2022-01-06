%Cette fonction retourne LBP d'une image en prenant comme paramètres:
%L'image
%(R,N): N, le nombre de voisins à analyser et R, 
%le rayon du cercle sur lequel ces voisins se situent
%mapping: Le paramètre mapping (u2, ri, riu2),
% 0 pour LBP sous sa forme classique
%mode: ’h’ ou ’hist’: pour l'obtention d'un histogramme des LBP,
% 'nh': pour une version normalisée de l’histogramme des LBP,
% "" va renvoyer l’image des LBP
function lb = LbpOfImage(img,R,N,mapping,mode)
if(mapping == 0)
    map=0;
else
    map = getmapping(N,mapping) ;
end
  lb = lbp(img,R,N,map,mode);
  plot(lb);
  str = sprintf('[%d, %d] option %s', R,N, mapping);
  title(str) 
end