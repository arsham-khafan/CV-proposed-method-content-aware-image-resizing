function [J,Enew] = remove_horizontal_seam(Sx,I,E)
    J = I;
    Enew = E;
    for i = 1:size(Sx,1)
        for j = Sx{i,2}:size(J,1) - 1
            J(j,Sx{i,1},:) = J(j + 1,Sx{i,1},:);
            Enew(j,Sx{i,1}) = Enew(j + 1,Sx{i,1});
        end
    end
    Enew = Enew(1:end - 1,:);
    J = J(1:end - 1,:,:);
end