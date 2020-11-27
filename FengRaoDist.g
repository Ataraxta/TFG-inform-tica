#Computes the i-th Feng-Rao Distance of a numerical Semigroup, S.
FengRaoDist := function(i,S)
  local fr, nu, j, c, g;
  c:=Conductor(S);
  g:=Genus(S);
  #Simple case, when i>=2c-g-1, then it is just the value of nu_i
  if i>=2*c-g-1 then
    return Nu(i,S);
  #Otherwise, compute the minimun nu_j, i<=j<=2c-g-1
  else
    fr:=Nu(i,S);
    for j in [(i+1)..(2*c-g-1)] do
      nu:=Nu(j,S);
      if nu<fr then
        fr:=nu;
      fi;
    od;
    return fr;
  fi;
end;
