#Computes Tau_i for the i-th element of semigroup S
TauSemigroup := function(i,S)
  local d, D, j, tau;
  D:=DivisorsOfElementInNumericalSemigroup(S[i],S);
  if D=[] then return 0;
  else
    for d in D do
      if d<=(S[i]/2) then
         tau:=NumberElement_NumericalSemigroup(S,d)-1;
      fi;
    od;
    return tau;
  fi;
end;
