function C = gen_circ(v)
    n = length(v); % the size of the vector
    C = zeros(n,n);
    C(1,:)=v;
    for i = 2:n
        C(i, :)=circshift(v,i-1);
    end
end

%it has time complexity of n^2.