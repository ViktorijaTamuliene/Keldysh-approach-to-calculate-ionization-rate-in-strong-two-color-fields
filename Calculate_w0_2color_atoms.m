% Calculate_wo_2color_atoms.m

% Calculate ionization rate
% dependence on intensity at g2/g1=1 ratio for H, He, Ar and Xe atoms

% Fill the dat directory with dat files.
% Plot the results with Paint_w0_2color_atoms.m


% The calculation of w_{a,b} (a=\pm \alpha, b=\pm\beta) ionization rate
% parts is much slower and it has little impact. One can comment out
% the corresponding parts of the code, the results will not be influenced a lot.

% Two-color case

function Calculate_w0_2color_atoms
clear all
close all




g_ratio=1;
n_ratio=length(g_ratio);

K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
K.c=3*10^8;
K.Eh=4.3597*10^-18;
K.a0=5.2917*10^-11;
K.me=9.1093*10-31;

Ua_atoms=[13.6,24.6,15.6,11.14]*K.qe;% Potential, H, He, Ar and Xe atoms

for i_atoms=1:length(Ua_atoms)


lambda1=800*10^-9; % fundamental harmonic wavelength
P.w1=2*pi*K.c/lambda1;
P.I0=Ua_atoms(i_atoms);
g1a=[0.01:0.005:0.1, 0.1:0.05:1, 1:0.1:10];
na=(0:1:800);
EEE_aa=zeros(length(g1a),length(na));
EEE_ama=zeros(length(g1a),length(na));
EEE_bb=zeros(length(g1a),length(na));
EEE_bmb=zeros(length(g1a),length(na));


EEE_ab=zeros(length(g1a),length(na));
EEE_mab=zeros(length(g1a),length(na));
EEE_amb=zeros(length(g1a),length(na));
EEE_mamb=zeros(length(g1a),length(na));

for ig=1:length(g1a)
g1=g1a(ig);

disp(['U_atom: ',num2str(P.I0/K.qe),'eV, ', num2str(ig/length(g1a)*100),'% done']);

g2=g_ratio*g1;

inn=20*g1;
if inn<10
    inn=10;
end
for in=1:inn
n=na(in);

EEE_aa(ig,in)=w0aa(K,P,g1,g2,n);
EEE_ama(ig,in)=w0ama(K,P,g1,g2,n);
EEE_bb(ig,in)=w0bb(K,P,g1,g2,n);
EEE_bmb(ig,in)=w0bmb(K,P,g1,g2,n);

if isnan(EEE_ama(ig,in)) || isinf(EEE_ama(ig,in))
    EEE_ama(ig,in)=0;
end

if isnan(EEE_bb(ig,in)) || isinf(EEE_bb(ig,in))
    EEE_bb(ig,in)=0;
end

if isnan(EEE_bmb(ig,in)) || isinf(EEE_bmb(ig,in))
    EEE_bmb(ig,in)=0;
end


EEE_ab(ig,in)=w0ab(K,P,g1,g2,n);
EEE_mab(ig,in)=w0mab(K,P,g1,g2,n);
EEE_amb(ig,in)=w0amb(K,P,g1,g2,n);
EEE_mamb(ig,in)=w0mamb(K,P,g1,g2,n);
if isnan(EEE_ab(ig,in)) || isinf(EEE_ab(ig,in))
    EEE_ab(ig,in)=0;
end

if isnan(EEE_mab(ig,in)) || isinf(EEE_mab(ig,in))
    EEE_mab(ig,in)=0;
end

if isnan(EEE_amb(ig,in)) || isinf(EEE_amb(ig,in))
    EEE_amb(ig,in)=0;
end


if isnan(EEE_mamb(ig,in)) || isinf(EEE_mamb(ig,in))
    EEE_mamb(ig,in)=0;
end


end


end
str=['2color_atoms_',num2str(i_atoms)];

save(['dat/g1_',str,'.dat'],'g1a','-ascii');
save(['dat/waa_',str,'.dat'],'EEE_aa','-ascii');
save(['dat/wama_',str,'.dat'],'EEE_ama','-ascii');
save(['dat/wbb_',str,'.dat'],'EEE_bb','-ascii');
save(['dat/wbmb_',str,'.dat'],'EEE_bmb','-ascii');


save(['dat/wab_',str,'.dat'],'EEE_ab','-ascii');
save(['dat/wmab_',str,'.dat'],'EEE_mab','-ascii');
save(['dat/wamb_',str,'.dat'],'EEE_amb','-ascii');
save(['dat/wmamb_',str,'.dat'],'EEE_mamb','-ascii');

end % for i_atoms

end
% Indices:

% 1  -  H atom

% 2  -  He atom

% 3  -  Ar atom

% 4  -  Xe atom
