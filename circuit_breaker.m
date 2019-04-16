
p1=0
p2=1
p3=1
p4=1
p5=1
p6=1
AGIRLIK1=0.2
AGIRLIK2=0.1
AGIRLIK3=0.7

for n=1000:500:10000
    
  
    for k=100:50:1000
     %-------------------------A Markasi--------------------------
    marka_A(p2+p1,1)=n;
    marka_A(p1+p2,2)=k;
    
    marka_A(p3,3)=randi([0  100],1,1);  %  Secim Parametresi1   Reliability
    marka_A(p4,4)=randi([0  100],1,1);  %   Secim PArametresi   Environment
    marka_A(p5,5)=randi([0  100],1,1);  %  Secim parametresi     COST
    
    marka_A(p6,6)= AGIRLIK1*marka_A(p3,3)+AGIRLIK2*marka_A(p4,4)+AGIRLIK3*marka_A(p5,5);   %  Secim Skor Puani 100 uzerinden hepsi
    %-------------------------B Markasi--------------------------
    marka_B(p2+p1,1)=n;
    marka_B(p1+p2,2)=k;
    
    marka_B(p3,3)=randi([0  100],1,1);     %  Secim Parametresi1   Reliability
    marka_B(p4,4)=randi([0  100],1,1);      %   Secim PArametresi   Environment
    marka_B(p5,5)=randi([0  100],1,1);      %  Secim parametresi     COST
    
    marka_B(p6,6)= AGIRLIK1*marka_B(p3,3)+AGIRLIK2*marka_B(p4,4)+AGIRLIK3*marka_B(p5,5);  %  Secim Skor Puani 100 uzerinden hepsi
     %-------------------------C Markasi--------------------------
    marka_C(p2+p1,1)=n;
    marka_C(p1+p2,2)=k;
    
    marka_C(p3,3)=randi([0  100],1,1);      %  Secim Parametresi1   Reliability
    marka_C(p4,4)=randi([0  100],1,1);       %   Secim PArametresi   Environment
    marka_C(p5,5)=randi([0  100],1,1);      %  Secim parametresi     COST
    
    marka_C(p6,6)= AGIRLIK1*marka_C(p3,3)+AGIRLIK2*marka_C(p4,4)+AGIRLIK3*marka_C(p5,5);  %  Secim Skor Puani 100 uzerinden hepsi
    
    
    
    p1=p1+1;
    p3=p3+1;
    p4=p4+1;
    p5=p5+1;
    p6=p6+1;
    
    end
    
    p1=p1-1
    p2=p2+1;
end



