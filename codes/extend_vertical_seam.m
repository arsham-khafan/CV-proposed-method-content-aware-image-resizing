function [J,Enew] = extend_vertical_seam(Sx,I,E)
    J = [I zeros(size(I,1),1,3)];
    Enew = [E zeros(size(E,1),1)];
    for i = 1:size(Sx,1)
        for j = size(J,2) - 1: -1 :Sx{i,2}
            J(Sx{i,1},j + 1,:) = J(Sx{i,1},j,:);
            Enew(Sx{i,1},j + 1) = Enew(Sx{i,1},j);
        end
    end
end