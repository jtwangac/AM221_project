syms a b c d e f g h;

% Data points
y000 = a;
y001 = b;
y010 = c;
y011 = d;
y100 = e;
y101 = f;
y110 = g;
y111 = h;


%average variance given different feature set to partition data
v_012 = 0;
v_01 = (a^2+b^2) - 2*((a+b)/2)^2 + (c^2+d^2) - 2*((c+d)/2)^2 + (e^2+f^2) - 2*((e+f)/2)^2 +(g^2+h^2) - 2*((g+h)/2)^2;
v_02 = (a^2+c^2) - 2*((a+c)/2)^2 + (b^2+d^2) - 2*((b+d)/2)^2 + (e^2+g^2) - 2*((e+g)/2)^2 +(f^2+h^2) - 2*((f+h)/2)^2;
v_12 = (a^2+e^2) - 2*((a+e)/2)^2 + (b^2+f^2) - 2*((b+f)/2)^2 + (c^2+g^2) - 2*((c+g)/2)^2 +(d^2+h^2) - 2*((d+h)/2)^2;
v_empty = (a^2+b^2+c^2+d^2+e^2+f^2+g^2+h^2) - 8 * ((a+b+c+d+e+f+g+h)/8)^2;
v_0 = (a^2+b^2+c^2+d^2) - 4 * ((a+b+c+d)/4)^2 + (e^2+f^2+g^2+h^2) - 4 * ((e+f+g+h)/4)^2;
v_1 = (a^2+b^2+e^2+f^2) - 4 * ((a+b+e+f)/4)^2 + (c^2+d^2+g^2+h^2) - 4 * ((c+d+g+h)/4)^2;
v_2 = (a^2+c^2+e^2+g^2) - 4 * ((a+c+e+g)/4)^2 + (b^2+d^2+f^2+h^2) - 4 * ((b+d+f+h)/4)^2;

%u_01 = eval(subs(v_01, {a,b,c,d,e,f,g,h}, {1,2,3,4,5,6,7,8}))

%difference (i.e., return) in variance by adding a feature X0
d_0_empty = simplify(v_0 - v_empty);
d_01_1 = simplify(v_01 - v_1);
d_01_1_simplified = -((a+b-e-f)^2+(c+d-g-h)^2)/4;
d_02_2 = simplify(v_02 - v_2);
d_02_2_simplified = -((a+c-e-g)^2+(b+d-f-h)^2)/4;
d_012_12 = simplify(v_012 - v_12)
d_012_12_simplified = -((a-e)^2+(b-f)^2+(c-g)^2+(d-h)^2)/2;
simplify(d_01_1 - d_01_1_simplified)
simplify(d_02_2 - d_02_2_simplified)
simplify(d_012_12-d_012_12_simplified)

%difference in returns of adding feature X0 to different feature set
c_0_empty_1 = simplify(d_0_empty - d_01_1_simplified)
c_0_empty_2 = simplify(d_0_empty - d_01_1_simplified)
c_0_empty_12 = simplify(d_0_empty - d_012_12_simplified)
c_0_empty_12_simplified = ((a-b-e+f)^2+(a-c-e+g)^2+(a-d-e+h)^2+(b-c-f+g)^2+(b-d-f+h)^2+(c-d-g+h)^2)/8
c_0_1_12 = simplify(d_01_1_simplified - d_012_12_simplified)
c_0_1_12_simplified = simplify(((a-e-b+f)^2+(c-g-d+h)^2)/4)
c_0_2_12 = simplify(d_02_2_simplified - d_012_12_simplified)
c_0_2_12_simplified = simplify(((a-e-c+g)^2+(b-f-d+h)^2)/4)
simplify(c_0_empty_12 - c_0_empty_12_simplified)
simplify(c_0_1_12 - c_0_1_12_simplified)
simplify(c_0_2_12 - c_0_2_12_simplified)

%c_0_empty_1 = simplify(d_0_empty - d_01_1_simplified)
%expand(c_0_empty_1)
