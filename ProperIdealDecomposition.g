#Takes, I, a proper ideal of S, a numerical semigroup.
#Outputs a list of irreductible proper ideals whose intesection is I
#Requieres IdealByDivisorClosedSet.
ProperIdealDecomposition := function(I)
  local M,Dif,S, XI,output,x,d;
  if not(IsIntegral(I)) then
    Error("The argument must be an integral ideal (proper ideal)");
  fi;
  S:=AmbientNumericalSemigroupOfIdeal(I);
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
