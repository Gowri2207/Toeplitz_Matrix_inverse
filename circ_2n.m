%This function takes toeplitz matrix of size n and convert to circulant
%matrix of size 2n and from there it find the inverse

function T_inv = circ_2n(A) % A is toeplitz G is general matrix 
    n=size(A,2);
    v=zeros(2*n,1); %O(n)
    v(1:n)=A(1,:);

    for i = n+2 : 2*n
        v(i,1) = A((2*(n+1)-i),1);  %O(n)
    end
    v(n+1,1)=randi([0,9]);
    C_2n = gen_circ(v);  % circulant matrix of 2n is generated from toeplitz matrix %O(n^2)
 