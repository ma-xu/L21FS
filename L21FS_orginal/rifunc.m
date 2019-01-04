function [P,obj]=rifunc(X,k,gnd)
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

ite_max=30;
clear A0
c=1;
[A d v]=svd(X','econ');
A0=A(:,1:k);
Max=max(max(X));
Min=min(min(X));
X=2*(X-Min)./(Max-Min)-1;  %归一化，到[-1,1]之间；
for ite=1:ite_max    
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

 %-------------------theorem: St=Sb+Sw    ---------------------        
    St=zeros(size(X,2));
    Xmean=mean(X,1);clear D
    for i=1:size(X,1)
        D(i)=norm((X(i,:)-Xmean)*A0);
        D(i)=0.5/D(i);
        St=St+((X(i,:)-Xmean))'*D(i)*(X(i,:)-Xmean);
    end
    % Sb=Sb+eye(size(Sb));
    
    Du=sum(abs(A0).^2,2).^(1/2);
    Du=1./(2*Du);
    Du=diag(Du);
    
    
    
    [vec val0]=eig((St-Sw)\(Sw+c*Du));
    [val ind]=sort(diag(val0),'ascend');
    A0=real(vec(:,ind(1:k)));
    paper(ite)=trace(A0'*(Sw+c*Du)*A0)/trace(A0'*(St-Sw)*A0);
    obj(ite)=trace(A0'*(St\(Sw+c*Du))*A0);
    %obj(ite)=trace(A0'*St*A0)\trace(A0'*Sw*A0);
    P=A0;
    if ite>2
        det(ite,1)=abs(obj(ite)-obj(ite-1))/obj(ite);
    end
    if ite>5
       if abs(obj(ite)-obj(ite-1))/obj(ite) <0.01
          break
       end
    end
   
end
det
ite
end