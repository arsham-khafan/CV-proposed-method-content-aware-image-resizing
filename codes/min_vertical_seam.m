function [Sx , the_seam] = min_vertical_seam(E)
min_path = E;
Height = size(min_path,1);
Width = size(min_path,2);

for i = 2:Height
    for j = 1:Width
        if j == 1
            min_path(i,j) = min_path(i,j) + min([min_path(i - 1,j) min_path(i-1,j + 1)]);
        end

        if j == Width
            min_path(i,j) = min_path(i,j) + min([min_path(i - 1,j) min_path(i-1,j - 1)]);
        end

        if j ~= 1 && j~= Width
            min_path(i,j) = min_path(i,j) + min([min_path(i - 1,j + 1) min_path(i - 1,j) min_path(i-1,j - 1)]);
        end
    end
end

the_min = inf;
the_min_indx = -1;
for k = 1:Width
    if the_min > min_path(Height,k) %*************
        the_min = min_path(Height,k);
        the_min_indx = k;
    end
end
the_seam = zeros(size(min_path),'logical');
k = the_min_indx;
Sx = {Height k};
the_seam(Height,k) = 1;
the_k = k;
for i = Height - 1:-1:1
    if the_k == 1
        if min_path(i,the_k) > min_path(i,the_k + 1) %***********
            the_k = the_k + 1;
        end
    else 
        if the_k == Width
            if min_path(i,the_k) > min_path(i,the_k - 1)%***********
            the_k = the_k - 1;
            end
        else 
            the_min_min = inf;
            final_the_k = -1;
            for j = the_k - 1 : the_k + 1
                if(min_path(i,j) < the_min_min)%***********
                    the_min_min = min_path(i,j);
                    final_the_k = j;
                end
            end
            the_k = final_the_k;

        end
    end
    the_seam(i,the_k) = 1;
    Sx = [{i the_k} ; Sx];
end
end