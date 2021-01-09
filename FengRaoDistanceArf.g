#Computes the first Feng Rao Distance of an Arf semigrup
#S must be an Arf numerical semigroup (IsArf(s) is true)

FengRaoDistanceArf := function(S,n)
  local fr, c, r, i, l1, l2;
  c:=Conductor(S);
  r:=NumberElement_NumericalSemigroup(S,c);
  if n=1 then return 2; fi;
  if ( (c+r-2) <= n) then
    fr:=n+1-Genus(S);
  else
    for i in Reversed([1..(r-1)]) do
      l2:=r+S[i+1]-2;
      l1:=r+S[i]-2;
      if (l1<n) and (n<=l2) then
        fr:=2*i;
        break;
      fi;
    od;
  fi;
  return fr;
end;
