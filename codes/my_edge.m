function [G] = my_edge(I)
hx = -1 * fspecial("prewitt");
hy = hx.';
Gx = imfilter(I,hx,"replicate");
Gy = imfilter(I,hy,"replicate");
G = abs(Gx) + abs(Gy);
G = (G - min(min(G)))/(max(max(G)));
end