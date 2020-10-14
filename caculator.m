close all;
clear;
prompt1 = 'Please input the valve of lmda:';
lmda = input(prompt1);
prompt2 = 'Please input the valve of Ps:';
Ps = input(prompt2);
prompt3 = 'Please input the valve of N:';
N = input(prompt3);
prompt4 = 'Please input the valve of Ph:';
Ph = input(prompt4);
prompt5 = 'Please input the valve of Pk:';
Pk = input(prompt5);
prompt6 = 'Please input the valve of Pw:';
Pw = input(prompt6);
% lmda = 5;
% Ps = 0.17;
% N = 6;
% Ph = 0.9;
% Pk = 0.5;
% Pw = 0.66;
Pb = zeros(1,N);
for m = 1:N
    Pb(m) = nchoosek(N,m)*(Ps*Ph*Pk*Pw)^m*(1-Ps*Ph*Pk*Pw)^(N-m);
end
PA_B = zeros(N,lmda);
PAB = zeros(N,1);
for j = 1:N
        if(j>lmda)
            for k = 1:lmda
                PAB(j) = PAB(j)+nchoosek(j-1,k-1)*nchoosek(lmda,k);
            end
        else
            for k =1:j
                PAB(j) = PAB(j)+nchoosek(lmda,k);
            end
        end    
end   
    for j = 1:N
        if(j>lmda)
            for k = 1:lmda
               PA_B(j,k) = nchoosek(j-1,k-1)*nchoosek(lmda,k)/PAB(j);
            end
        else
            for k =1:j
                PA_B(j,k) = nchoosek(lmda,k)/PAB(j);
            end
        end 
    end
    q = Pb*PA_B
    q_n = 1-sum(q)
   q_y = 1-(1-Ps*Ph*Pk*Pw)^6;
   pq = 0;
   for i = 1:lmda
       pq = pq + i*q(i);
   end
     