
Err_inv_n=[];
Err_mat_n=[];
Err_sol_n=[];
size=[];

for n=1:10:500
    Err_inv=[];
    Err_mat=[];
    Err_sol=[];
    itr=[];
    for j=1:100
    %generating a toeplitz matrix
        c=randn(n,1);
        r=randn(1,n);
        c(1)=r(1);
        T=toeplitz(c,r);
        b=randn(n,1);
        act_sol= inv(T)*b;
        
        %Taking the first circulant component (only row vector)
        R=zeros(n,1);
        R(1)=c(1);
        for i=2:n
            R(i)=(1/n)*(((i-1)*(r(n-i+2)))+((n-i+1)*(c(i))));   %O(n)
        end
        % R is the first row of the first circulant component       %O(n)

        C_approx=gen_circ(R);
        an=zeros(n,1);
        an(1)=R(1);
        for i =2:n
            an(i)=R(n-i+2);
        end

        
        %Cauchy like matrix of a circulant matrix
        Cauchy_like=fft(an);   %O(n log n)
        e1=zeros(n,1);
        e1(1)=1;
        e1_transformed=fft(e1);   %O(n log n)
        y_trans=zeros(n,1);
        for i = 1:n
            y_trans(i)=1/Cauchy_like(i);   %O(n)
        end
        y=ifft(y_trans);   %O(n log n)
        %disp(y);
        T_inv_appr=zeros(n,n);
        for i =1:n
            T_inv_appr(:,i)=circshift(y,i-1);
        end
        % finding the approximate solution
        approx_sol=T_inv_appr*b;
        norm_x=norm(b, 'fro');
        norm_err_sol=norm(abs(act_sol-approx_sol), 'fro');
        norm_T=norm(T, 'fro'); %norm of T
        norm_T_inv=norm(inv(T),'fro'); % norm of T inv
        E=norm(abs(T_inv_appr-inv(T)),'fro');
        E=E/norm_T_inv; %Relative norm error in the inverse
        E_m=norm(abs(T-C_approx),'fro')/norm_T; %Relative error in the matrix approximation 
        Err_mat=[Err_mat,E_m];
        %disp(E);
        Err_inv=[Err_inv,E];
        E1=norm_err_sol/norm_x;
        Err_sol=[Err_sol,E1];
        %disp(Err);
        %disp(Err_mat);
        %y is the first column of the inverse of circulant matrix
        itr=[itr,j];

    end
    disp(n);
    Err_mat_mean=mean(Err_mat);
    Err_mat_n=[Err_mat_n,Err_mat_mean];
    Err_inv_mean=mean(Err_inv);
    Err_inv_n=[Err_inv_n,Err_inv_mean];
    Err_sol_mean = mean(Err_sol);
    Err_sol_n=[Err_sol_n,Err_sol_mean];
    size=[size,n];
end


subplot(3,1,1)
plot(size,Err_mat_n);
title('Error in the matrix approximation');
xlabel('Relative Error');
ylabel('Iteration');
subplot(3,1,2)
plot(size,Err_inv_n);
title('Error in the inverse of matrix');

subplot(3,1,3)
plot(size,Err_sol_n);
title('Error in the solution of the linear system');

xlabel('Relative Error');
ylabel('Iteration');
mean_inv_error = mean(Err_inv_n);
mean_mat_appr = mean(Err_mat_n);
mean_sol_error = mean(Err_sol_n);

disp("Mean relative error in the inverse: ");
disp(mean_inv_error);
disp('Mean relative error in the approximation of matrix: ');
disp(mean_mat_appr);
disp('Mean relative error in the solution of the linear system: ');
disp(mean_sol_error);

