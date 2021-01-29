TestFengRaoDistanceArf := function(S)
  local i, e, c, bool;
  c:= Conductor(S);
  e:=Multiplicity(S);
  if IsArf(S) then
    for i in [2..(2*c-1)] do
      bool:=(FengRaoDistance(S,1,S[i])=FengRaoDistanceArf(S,S[i]));
      Print(bool);
      Print("\t");
      Print(i);
      Print("\t");
      Print(FengRaoDistance(S,1,S[i]));
      Print("\t");
      Print(FengRaoDistanceArf(S,S[i]));
      Print("\t");
      Print(FengRaoDistanceBruteForce(S,S[i]));
      bool:=(FengRaoDistanceBruteForce(S,S[i])=FengRaoDistanceArf(S,S[i]));
      Print("\t");
      Print(bool);
      Print("\n");
    od;
  fi;
end;
