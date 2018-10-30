function HRR_curve

Qmax=1;

t0=0;
ti0=60;
td=110;
tend=520;

alfa_g=0.1;
alfa_d=0.00215;

t=t0:0.1:tend;

for i=1:length(t)

    if t(i)>=0 && t(i)<=t0
        Q(i)=0;
    elseif t(i)>t0 && t(i)<=ti0
        Q(i)=alfa_g*(t(i)-t0)^2;
    elseif t(i)>ti0 && t(i)<=td
        Q(i)=alfa_g*(ti0-t0)^2;
    elseif t(i)>td && t(i)<=tend
        Q(i)=alfa_d*(tend-t(i))^2;
    elseif t(i)>tend
        Q(i)=0;
    end
    
end

Q=Q/max(Q)*Qmax;

plot(t,Q); grid on;