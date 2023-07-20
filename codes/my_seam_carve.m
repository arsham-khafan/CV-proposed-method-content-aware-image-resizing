function [J,Enew] = my_seam_carve(I,DMap)
J = I;
Enew = DMap;
init_Width = size(I,2);
%a bit of resizing:------------------------------
J = imresize(J,[size(J,1) floor(6*size(J,2)/7)]);
Enew = imresize(Enew,[size(Enew,1) floor(6*size(Enew,2)/7)]);
%median filter for Dmap:-------------------------
Enew = medfilt2(Enew,[20 20]); 
%using edges and Dmap together:-----------------
Enew = (0.5 * my_edge(rgb2gray(J)) + 0.5 * Enew);

%---------------------------------------------------
while size(J,2) > floor(init_Width/2)
    [Sx, the_seam] = min_vertical_seam(Enew);
    show_seams(J,Enew,the_seam);
    [J,Enew] = remove_vertical_seam(Sx,J,Enew);
end

end