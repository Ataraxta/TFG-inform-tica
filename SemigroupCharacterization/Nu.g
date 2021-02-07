#This function computes nu of a certain index.
#I is the i-th element of the semigroup S
Nu := function(i,S)
  local d;
  d:=DivisorsOfElementInNumericalSemigroup(S[i],S);
  if d=[] then
     return 1;
  else
    return Length(d);
  fi;
end;
