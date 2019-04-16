
Vbase=evalin('base','Vbase'); % base voltage KV
Sbase=evalin('base','Sbase') ;% Base S MVA
nbus=evalin('base','nbus');
Z=evalin('base','Z');
V=evalin('base','V');
KD_empedans=evalin('base','KD_empedans');


Ibase = Sbase*10e6/(sqrt(3)*Vbase*1e3);
for KD_bara=1:nbus
k=KD_bara;
(Z(k,k)+KD_empedans);
IKD_sym(KD_bara)=V(k)/(Z(k,k)+KD_empedans);
IKD_sym_mag(KD_bara)=abs(IKD_sym(KD_bara)); % pu

IKD_Amp(KD_bara)=IKD_sym_mag(KD_bara)*Ibase;  %Amper

SC_capacity_pu(KD_bara)=abs(V(KD_bara)*IKD_sym(KD_bara)*sqrt(3)) ;% pu
SC_capacity(KD_bara)=SC_capacity_pu(KD_bara)*Sbase ; % MVA
end
 
    
KD_sym_sonuc=[IKD_sym_mag; IKD_Amp; SC_capacity_pu; SC_capacity];
KD_sym_sonuc=transpose(KD_sym_sonuc);
 
assignin('base','IKD_sym',IKD_sym);
assignin('base','IKD_sym_mag',IKD_sym_mag);
assignin('base','IKD_K_Amp',IKD_Amp/1000);
assignin('base','SC_capacity_pu',SC_capacity_pu);
assignin('base','SC_capacity',SC_capacity);
assignin('base','KD_sym_sonuc',KD_sym_sonuc);

sonuc4

