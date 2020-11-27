#This function computes nu of a certain index.
#I is the i-th element of the semigroup S
Nu := function(i,S)
  local d;
  d:=DivisorsOfElementInNumericalSemigroup(S[i],S);
  return Length(d);
end;
