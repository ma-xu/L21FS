function [ A,selected ] = svc( X,gamma,l,p,labels )
% X:样本
%gamma:平衡参数
%l:降维维数
%p：p值
%label:样本标签

    %% total scatter matrix-> St
    meanX = mean(X);
    mx = bsxfun(@minus, X, meanX);
    St = mx'*mx;
    %% between classs catter matrix-> Sb
    unilabel = unique(labels);
    classnum = size(unilabel,1);
    for i=1:classnum
        idx = find(labels==unilabel(i,1));
        meanB(i,:) = mean(X(idx,:),1);
    end
    meanBB = bsxfun(@minus, meanB, meanX);
    Sb=0;
    for i=1:classnum
        nk =  size(find(labels==unilabel(i,1)),1);
        Sb = Sb + nk*(meanBB(i,:)'*meanBB(i,:));
    end;

    %{  
    %% within class scatter matrix -> Sw
    Sw = zeros(size(Sb));
    for i=1:classnum
        idx = find(labels==unilabel(i,1));
        d = bsxfun(@minus, X(idx,:), meanB(i,:));
        Sw = Sw + (d'*d);
    end
    %}

    
    %% repeat until converge
    [m,n]=size(X);
    AA=zeros(n,l);
    A = ones(n,l);
    D =sum(A.*A,2);
    D = bsxfun(@plus,D,1e-7);
    D=0.5*p*(D.^(0.5*p-1));
    D = diag(D);
    
    %{
    %% init D
    [m,n]=size(X);
    D = ones(n,1);
    D=diag(D);
    %}
    
    itear=0;
    Divergence =100; %measure the divergence between two sequential As
    selected = [];
    while Divergence>0.00001 && itear<=50
        % solve the generalized eigen-problem
        %[V,D] = eig(A,B)    %计算广义特征值向量阵V和广义特征值阵D，满足AV=DBV。
        newSb=gamma*D-Sb;
        St = St+(1e-7)*eye(size(St)); % St nonsingular
        [eigVector,eigValue] = eig(newSb,St);
        eigValue = diag(eigValue);
        [~, index] = sort(abs(eigValue));
        eigVector = eigVector(:, index);
        AA = A;
        A= eigVector(:,1:l);
        selected = index(1:l,1);
        D =sum(A.*A,2);
        D = bsxfun(@plus,D,1e-7);
        D=0.5*p*(D.^(0.5*p-1));
        D = diag(D);
        A=A./norm(A,'fro');
        Divergence = sum(abs(sum(A.*A)-sum(AA.*AA)));

        itear=itear+1;
    end;
   
end

