#For semigroup S, generates list of triplets [i,j,k] such tht k=Oplus(i,j)
#l1, l2 are the dimensions
createO:=function(S,l1,l2)
local i, j, O;
O:=[];
for i in [1..l1] do
  for j in [1..l2] do
    Add(O,[i,j,Oplus(i,j,S)]);
  od;
od;
return O;
end;
