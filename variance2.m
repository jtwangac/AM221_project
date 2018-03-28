syms a b c d;
v_empty = (a^2+b^2+c^2+d^2) - 4 * ((a+b+c+d)/4)^2;
v_0 = (a^2 + b^2) - 2 * ((a+b)/2)^2 + (c^2+d^2) - 2 * ((c+d)/2)^2;
v_1 = (a^2 + c^2) - 2 * ((a+c)/2)^2 + (b^2+d^2) - 2 * ((b+d)/2)^2;
v_01 = 0;
d_0_empty = simplify(v_0 - v_empty)
d_01_1 = simplify(v_01 - v_1)
c_0_empty_1 = simplify(d_0_empty - d_01_1)

%{
syms a b c d e f g h;
v_empty = (a^2+b^2+c^2+d^2+e^2+f^2+g^2+h^2) - 8 * ((a+b+c+d+e+f+g+h)/8)^2;
v_0 = (a^2+b^2+c^2+d^2) - 4 * ((a+b+c+d)/4)^2 + (e^2+f^2+g^2+h^2) - 4 * ((e+f+g+h)/4)^2;
v_1 = (a^2+b^2+e^2+f^2) - 4 * ((a+b+e+f)/4)^2 + (c^2+d^2+g^2+h^2) - 4 * ((c+d+g+h)/4)^2;
v_01 = 0;
d_0_empty = simplify(v_0 - v_empty)
d_01_1 = simplify(v_01 - v_1)
d_01_1_simplified = -((a-b)^2+(a-e)^2+(a-f)^2+(b-e)^2+(b-f)^2+(e-f)^2+(c-d)^2+(c-g)^2+(c-h)^2+(d-g)^2+(d-h)^2+(g-h)^2)/4;
simplify(d_01_1 - d_01_1_simplified)
c_0_empty_1 = simplify(d_0_empty - d_01_1_simplified)
expand(c_0_empty_1)
%}