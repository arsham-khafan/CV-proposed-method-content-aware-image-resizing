function [J,Enew] = extend_horizontal_seam(Sx,I,E)
    J = [I ; zeros(1,size(I,2),3)];
    Enew = [E ; zeros(1,size(E,2))];
    for i = 1:size(Sx,1)
        for j = size(J,1) - 1: -1 :Sx{i,2}
            J(j + 1,Sx{i,1},:) = J(j,Sx{i,1},:);
            Enew(j + 1,Sx{i,1}) = Enew(j,Sx{i,1});
        end
    end
end