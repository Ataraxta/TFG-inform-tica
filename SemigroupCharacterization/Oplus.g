#This operation implemets index addition in a semigroup.
#For i and j the j-th and i-th elements of S (a certain semigroup),
#oplus(i,j) is the index of the (i+j)-th element of the semigroup.
#The element with index 1 of the semigroup is 0.

Oplus := function(i,j,S)
  local s, k;
  s:=S[i]+S[j];
  k:=NumberElement_NumericalSemigroup(S,s);
  return k;
end;
