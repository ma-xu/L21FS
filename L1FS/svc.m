function [ W ] = svc( labels,X,lambd,rdim )
    %labels : labels for samples (number*1)
    % X: samples (number*dimension)
    %lambd: parameter, real number
    %rdim: the project matrix dimension (real number)
    % W: the project matrix (dimension*rdim)
    %{
    i =2;
    wi=sva(labels,X,lambd);
    W=[];
    W=[W wi];
    while i<=rdim
        Xi = X-X*wi*wi';
        wi=sva(labels,Xi,lambd);
        W=[W wi];
        X=Xi;
        i=i+1;
    end
    %}
    
    
    W=[];
    wi=sva(labels,X,lambd);
    W=[W wi];
    i=2;
    %svb( labels,X,lambda,w1)
    while i<=rdim
        X = X-X*wi*wi';
        w1=W(:,end);
        wi=svb( labels,X,lambd,w1);
        wi=(eye(size (X,2))-W*W')*wi;
        W=[W wi];
        i=i+1;
    end
    

end

