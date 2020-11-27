#Calculates nu sequence of semigroup, up to nu_i=2c-g-1.
#For numbers greater than that, it increases 1 by 1.
NuSequence := function(S)
  local i, seq, nu, c, g;
  seq:=[];
  c:=Conductor(S);
  g:=Genus(S);
  for i in [1..(2*c-g-1)]  do
    nu:=Nu(i,S);
    Add(seq,nu);
  od;
  return seq;
end;
