% U'*A*U+U'*B*U == U'*(A+B)*U?
U=rand(3,4);
A=rand(3,3);
B=rand(3,3);
first= U'*A*U+U'*B*U;
second = U'*(A+B)*U;
result = (A==B)
trace1=trace(U'*A*U)+trace(U'*B*U);
trace2=trace(U'*(A+B)*U);

