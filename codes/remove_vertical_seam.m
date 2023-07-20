function [J,Enew] = remove_vertical_seam(Sx,I,E)
    J = I;
    Enew = E;
    for i = 1:size(Sx,1)
        for j = Sx{i,2}:size(J,2) - 1
            J(Sx{i,1},j,:) = J(Sx{i,1},j + 1,:);
            Enew(Sx{i,1},j) = Enew(Sx{i,1},j + 1);
        end
    end
    Enew = Enew(:,1:end - 1);
    J = J(:,1:end - 1,:);
end