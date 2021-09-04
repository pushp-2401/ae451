w = 150* 9.81;
sed = 220;
ar = 10;
b = 8.2;
s = b^2 /ar;
%cl_initial = 0.2;
k = 0.0613;
%cd0 = 0.1;
wb = [];
cd = [];
er = [];
cdo = [];
cl_by_cd = 12:1:20
% for i = 1:1:9
%    v = abs (sqrt(2*w/(s*1.225*cl0)))
%    cd(i) = cl0/cl_by_cd(i);
%    cdo(i) = cd - k* cl0^2;
%    er(i) = 0.85*0.5*1.225* v^3* s* cd* 1.2 * 60; 
%    wb(i) = er/sed;
% end
l_by_d = 12: 1:20;
d = [];
cl = [];
pr = [];
tr = [];
v = 40;
for i = 1: 1:9
    %v = abs (sqrt(2*w/(s*1.225*cl0)));
    %cl(i) = 2*w / (1.225 * v^2 * s);
    d(i) = 2* w/ l_by_d(i);
    cd(i) = 2* d(i)/ (1.225 * v^2 * s);
    cl(i) = cd(i)*l_by_d(i)
    cdo (i) = cd(i) - (k *(cl(i)^2));
    pr(i) = d(i)*v;
    er(i) = 0.85 * pr(i) * 1.2 * 3600;
    wb(i) = er(i)/ sed;
    tr(i) = w/l_by_d(i);
end

figure ()
plot (l_by_d, d, '-o')
xlabel ('L/D')
ylabel('D')

figure ()
plot (l_by_d, cd, '-o')
xlabel ('L/D')
ylabel('Cd')

figure ()
plot (l_by_d, cl, '-o')
xlabel ('L/D')
ylabel('Cl')

figure ()
plot (l_by_d, cdo, '-o')
xlabel ('L/D')
ylabel('Cd0')

figure ()
plot (l_by_d, pr, '-o')
xlabel ('L/D')
ylabel('Pr(W)')

figure ()
plot (l_by_d, er, '-o')
xlabel ('L/D')
ylabel('Er(J)')

figure ()
plot (l_by_d, wb, '-o')
xlabel ('L/D')
ylabel('Wb(kg)')

figure ()
plot (l_by_d, tr, '-o')
xlabel ('L/D')
ylabel('Tr(N)')