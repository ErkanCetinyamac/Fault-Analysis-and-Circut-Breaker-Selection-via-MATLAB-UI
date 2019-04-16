
load('circuir_breaker_markalar_data.mat')

%secim=zeros(nbus,1);
secim=cell(nbus,1);
%secim=char(nbus,1)
for bara=1:nbus
   degerler(bara,1)=max_akim_amp(bara)
   degerler(bara,2)=SC_capacity(bara)
    reset=1
for n=1:361
    if max_akim_amp(bara)<marka_A(n,1) 
        if n>1
                if SC_capacity(bara)<marka_A(n,2) && SC_capacity(bara)>marka_A(n-1,2) && reset==1 
            
            satir(bara)=n;
            reset=0
                end
                satir(bara)=1
        end
        
    end
end

if marka_A(satir(bara),6)>marka_B(satir(bara),6)
    if marka_A(satir(bara),6)>marka_C(satir(bara),6)
       
        for t=1:6
            degerler(bara,t+2)=marka_A(satir(bara),t);
        end
         secim(bara)= {'A'}
         
           
    end
end

if marka_B(satir(bara),6)>marka_A(satir(bara),6)
    if marka_B(satir(bara),6)>marka_C(satir(bara),6)
        for t=1:6
            degerler(bara,t+2)=marka_B(satir(bara),t);
        end
         secim(bara) ={'B'}
         
          
        
        
    end
end

if marka_C(satir(bara),6)>marka_A(satir(bara),6)
    if marka_C(satir(bara),6)>marka_B(satir(bara),6)
         for t=1:6
            degerler(bara,t+2)=marka_C(satir(bara),t);
        end
         secim(bara)={'C'}
         
    end
end


end
sonuc3
