#Takes as an input Oplus, given as a list o tripelts, outputs the maximum number of
# nu sequence values that can be computet with the given information.
NuFromOplus := function(O)
  local i, Nu, r, nu, j, maxj, maxi;
  Nu:=[];
  r:=Length(O);
  #We want the maximun i, and j
  SortBy(O, x -> x[1]);
  maxi:=O[r][1];
  SortBy(O, x -> x[2]);
  maxj:=O[r][2];
  #First, sort by k
  SortBy(O, x -> x[3]);
  j:=1;
  nu:=1;
  for i in [2..r] do
    #If this first condition is met, more information is needed to compute nu[j]
    if (maxi < O[i][3]) or (maxj < O[i][3]) then break; fi;
    if O[i-1][3]=O[i][3] then
      nu:=nu+1;
    else
      Nu[j]:=nu;
      j:=j+1;
      nu:=1;
    fi;
  od;

  return Nu;
end;
