#Takes, I, a proper ideal of S, a numerical semigroup.
#Outputs a list of irreductible proper ideals whose intesection is I
#Requieres IdealByDivisorClosedSet.
ProperIdealDecomposition := function(I,S)
  local M,Dif, XI,output,x,d;
  M:=MaximalIdeal(S);
  Dif:=I-M;
  XI:=Difference(Intersection(0+S,Dif),I);
  output:=[];
  for x in XI do
    d:=DivisorsOfElementInNumericalSemigroup(x,S);
    Add(output,IdealByDivisorClosedSet(d,S));
  od;
  return output;
end;
