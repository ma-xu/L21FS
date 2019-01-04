function [ w ] = svb_fake( A,B,lambd,w1)
%A:     m1Xn
%B:     m2Xn
%psi:   real number
%c:     real number
%w1:    nX1 vector
%author: maxu 2017-11-03 

   





    % initalize w
    w=ones(size(w1));
    
    
    %initalize varibale for iterations
    delta = inf;
    itear = 1;
    
    
    %iterations
    while delta>0.0001 && itear<=100
        c=(norm(A*w,1)+lambd*norm(w,1))/norm(B*w,1);
        
        %compute D,E,F
       % D=diag(1./(2*A*w+(1e-7)));
        D=2*A*w;
        D(D<0.00001)=1e-5;
        D=diag(1./D);
        %E=diag(1./(2*w+(1e-7))); 
        E=2*w;
        E(E<0.00001)=1e-5;
        E=diag(1./E);
        s=B*w./abs(B*w+(1e-7));
        Z=4*A'*D*A+4*lambd*E;
        invZ=Z^(-1);
        U=w1'*invZ*c*B'*s;
        V=w1'*invZ*w1;
        alpha=U*V^(-1);
        w=invZ*c*B'*s-alpha*invZ*w1;
        w=w./norm(w);
        
        objVAL(itear,1)=norm(A*w,1)+lambd*norm(w,1)-c*norm(B*w,1);
        if itear >1
            delta = abs(objVAL(itear,1)-objVAL(itear-1,1));
        end
        itear = itear+1;
       
    end

    itear
end

