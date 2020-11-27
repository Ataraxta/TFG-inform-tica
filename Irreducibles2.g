ProperIdealDecomposition := function(I,S)
  local M,Dif, XI,output,x,d;
  M:=MaximalIdeal(S);
  Dif:=I-M;
  XI:=Difference(Intersection(0+S,Dif),I);
  output:=[];
  for x in XI do
    d:=DivisorsOfElementInNumericalSemigroup(x,S);
    Add(output,d);
  od;
  return output;
end;
