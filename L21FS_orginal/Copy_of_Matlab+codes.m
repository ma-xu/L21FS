function [P obj]=RI_SL_via_L21_f(X,k,Ww,Wb,options)
%rotational invariant subspace learning via L21 norm optimization
%P:projection matrix,k:the number of the projections
%Ww: within class graph,Wb:between class graph
%obj:the value of the objective function
%X:data matrix, each row is a data point

%min sum_i sum_j ||xi-xj||*Ww(i,j)          ==>
% s.t. sum_i sum_j ||xi-xj||*Wb(i,j)=1

%special notes: such optimization problem can onlu using the minization of
%the objective function. if using the maximization of the objective
%function, the algorithm will not converge!!!
gnd=options.gnd;
ite_max=30;
% if isfield(options,'PCA')
%     k=size(X,2);            %so that we can left the larger eigvectors
% elseif k>size(X,2)
%     k=size(X,2);
% end
clear A0

[A d v]=svd(X','econ');
A0=A(:,1:k);
% A0=rand(size(X,2),k);

for ite=1:ite_max
    switch options.method
        case 'PCA'%options.PCA==1%
            St=zeros(size(X,2));
            Xmean=mean(X,1);
            for i=1:size(X,1)
                D(i)=norm((X(i,:)-Xmean)*A0);
                D(i)=0.5/D(i);
                St=St+((X(i,:)-Xmean))'*D(i)*(X(i,:)-Xmean);
            end
    % 
    %         XX=X-repmat(Xmean,size(X,1),1);XXA=XX*A0; 
    %         Db0=sqrt(sum(XXA.*XXA,2));
    %         Db0 = 0.5./(Db0);
    %         Db=diag(Db0);
    %         St=XX'*Db*XX;
    %         
            [vec val0]=eig(St);
            [val ind]=sort(diag(val0),'descend');
            [val2 ind2]=sort(diag(val0),'descend');
            A0=real(vec(:,ind(1:k)));
            obj(ite)=trace(A0'*inv(St+0.0001*eye(size(St)))*A0);
            %obj2(ite)=trace(vec(:,ind2(1:end))'*St*vec(:,ind2(1:end)));
            P=vec(:,ind2(1:k));


        case 'LDA'
            Sw=zeros(size(X,2)); Sb=zeros(size(X,2)); 
            classLabel = unique(gnd);
            nClass = length(classLabel);%Number of classes
            ClsIdxs=cell(nClass);
            Ns=zeros(nClass,1);
            Xtmean=mean(X,1);
            for i=1:nClass
                ClsIdxs{i}=find(gnd==classLabel(i));
                Ns(i)=length(ClsIdxs{i});
            end

            for i=1:nClass%SW
                clsYp=X(ClsIdxs{i},:);
                clsMean=mean(clsYp,1);
                XmeanDiff=(clsYp-repmat(clsMean,Ns(i),1));
                XmeanDiffA0=XmeanDiff*A0;
                Dw=sqrt(sum(XmeanDiffA0.*XmeanDiffA0,2));
                Dw=0.5./Dw;
                Sw=Sw+XmeanDiff'*diag(Dw)*XmeanDiff;
            end
    %         for i=1:nClass%Sb
    %             clsYp=X(ClsIdxs{i},:);
    %             XclsMean(i,:)=mean(clsYp,1);
    %             Db=norm((XclsMean(i,:)-Xtmean)*A0);
    %             Db=0.5/Db;
    %             Sb=Sb+Ns(i)*(XclsMean(i,:)-Xtmean)'*Db*(XclsMean(i,:)-Xtmean);
    %         end
             %-------------------theorem: St=Sb+Sw    ---------------------        
            St=zeros(size(X,2));
            Xmean=mean(X,1);clear D
            for i=1:size(X,1)
                D(i)=norm((X(i,:)-Xmean)*A0);
                D(i)=0.5/D(i);
                St=St+((X(i,:)-Xmean))'*D(i)*(X(i,:)-Xmean);
            end

    %         Sb=Sb+eye(size(Sb));
            [vec val0]=eig(St\Sw);
            [val ind]=sort(diag(val0),'ascend');
            A0=real(vec(:,ind(1:k)));
            obj(ite)=trace(A0'*(St\Sw)*A0);
            %obj(ite)=trace(A0'*St*A0)\trace(A0'*Sw*A0);
            P=A0;

    
        case 'LPP'   
            Sw=zeros(size(X,2)); Sb=zeros(size(X,2)); 
            for i=1:size(X,1)
                for j=1:size(X,1)
                    if Ww(i,j)~=0
                        XwDiff=Ww(i,j)*((X(i,:)-X(j,:)));
                        Dw=norm(XwDiff*A0);
                        Dw=0.5./(Dw+eps);
                        Sw=Sw+XwDiff'*Dw*XwDiff;
                    end
                end
            end
            Wb=diag(sum(Ww,2));
            for i=1:size(X,1)
                Db=norm(Wb(i,i)*(X(i,:)*A0));
                %if Db~=0; Db=0.5/Db;end
                Db=0.5/(Db+eps);
                Sb=Sb+(Wb(i,i)*X(i,:))'*Db*Wb(i,i)*X(i,:);
            end
            Sb=Sb+eye(size(Sb))*10^-5;
            [vec val0]=eig(Sb\Sw);
            [val ind]=sort(diag(val0),'ascend');
            A0=real(vec(:,ind(1:k)));
            %obj(ite)=trace(A0'*Sb*A0)\trace(A0'*Sw*A0);
            obj(ite)=trace(A0'*(Sb\Sw)*A0);
            P=A0;

    
        case 'MFA'
            Sw=zeros(size(X,2)); Sb=zeros(size(X,2));
            for i=1:size(X,1)
                for j=1:size(X,1)
                    if Ww(i,j)~=0
                        XwDiff=Ww(i,j)*((X(i,:)-X(j,:)));
                        Dw=norm(XwDiff*A0);
                        if Dw~=0,Dw=0.5/Dw;end
                        Sw=Sw+XwDiff'*Dw*XwDiff;
                    end
                end
            end
            Wb=full(Wb);
            for i=1:size(X,1)
                for j=1:size(X,1)
                    if Wb(i,j)~=0
                        XbDiff=Wb(i,j)*((X(i,:)-X(j,:)));
                        Db(i,j)=norm(XbDiff*A0);
                        if Db(i,j)~=0,Db(i,j)=0.5/Db(i,j);end
                        Sb=Sb+XbDiff'*Db(i,j)*XbDiff;
                    end
                end
            end
            Sb=Sb+eye(size(Sb))*10^-5;
            [vec val0]=eig(Sb\Sw);
            [val ind]=sort(diag(val0),'ascend');
            A0=real(vec(:,ind(1:k)));
            obj(ite)=trace(A0'*(Sw\Sb)*A0);
            P=A0;    
    end
   
    if ite>5
       if abs(obj(ite)-obj(ite-1))/obj(ite) <0.01
          break
       end
    end
end
clear A0