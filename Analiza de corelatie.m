load lab5_1.mat

% Parametri
N = 2500;

% Date de identificare
d_id=detrend(iddata(id));%eliminam zgomotul alb
u_id=id.u-mean(id.u);
y_id=id.y-mean(id.y);
tid=tid - mean(tid);

figure;
subplot(2,1,1);
plot(d_id);
%subplot(2,1,2);
%plot(tid, [u_id, y_id]);

%[c, tau] = xcorr(id.u);
%figure;
%plot(tau, c);
%title("Zgomot alb")

% Date de validare
d_val=detrend(iddata(val));
u_val=val.u-mean(val.u);
y_val=val.y-mean(val.y);
tval=tval-mean(tval);

figure;
subplot(2,1,1);
plot(d_val);
%subplot(2,1,2);
%plot(tval, [u_val, y_val]);

% Calculul coeficienților h pentru diverse valori ale lui M
M_values=20:15:80;
for M=M_values
    r_uu=xcorr(u_id,M);
    r_yu=xcorr(y_id,u_id,M);
    
    phi=FIR(r_uu,M);
    h=phi\r_yu;

    yv=conv(h,u_val);
    yv=yv(1:length(u_val));

    yi=conv(h,u_id);
    yi= yi(1:length(u_id));
    
    figure;
    plot(tval,[y_val,yv]);
    title('M= ',num2str(M));

    figure
    plot(tid,[y_id, yi])
    
    err=y_val - yv;
    MSE=mean(err.^2);
    disp(['MSE for M= ',num2str(M),' is ',num2str(MSE)]);
end

% Calculul MSE pentru diferite valori ale lui M
M_values=1:100;
MSE_values=zeros(1, length(M_values));
for i=1:length(M_values)
    M=M_values(i);
    r_uu=xcorr(u_id, M);
    r_yu=xcorr(y_id, u_id, M);
    
    phi=FIR(r_uu, M);
    h=phi\r_yu;

    yv=conv(h,u_val);
    yv=yv(1:length(y_val));

    yi=conv(h,u_id);
    yi= yi(1:length(u_id));

    err2=y_id-yi;
    MSE2=mean(err2.^2);
    MSE_ID(i)=MSE2;

    err=y_val-yv;
    MSE=mean(err.^2);
    MSE_values(i)=MSE;

   % fprintf("MSE = %.5f/n", MSE)
end

figure
stem(M_values,MSE_values);
title('MSE for different values of M');


% Definirea funcției FIR
%FIR-ul calculeaza matricea sistemului liniar de regresori in medie 0 
function reg=FIR(u,M)
    reg=zeros(length(u),M);
    for i=1:length(u)
        for j=1:M
            if (i>j)
                reg(i,j) = u(i-j+1);
            elseif (i<j)
                reg(i,j) = u(j-i+1);
            end
        end
    end
end