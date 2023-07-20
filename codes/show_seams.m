function [] = show_seams(J,Enew,the_seam)
    E = Enew;
    I = J;
    R = E;
    G = E;
    B = E;
    B(the_seam == 1) = 1;
    R(the_seam == 1) = 0.3;
    indicated_E = cat(3,R,G,B);
    
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    B(the_seam == 1) = 1;
    R(the_seam == 1) = 0.3;
    indicated_im = cat(3,R,G,B);
    subplot(1,2,1)
    imshow(indicated_im,[])
    subplot(1,2,2)
    imshow(indicated_E,[])
    pause(0.01)
end