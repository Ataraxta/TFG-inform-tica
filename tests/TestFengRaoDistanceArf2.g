TestFengRaoDistanceArf2 := function(S)
  local i, e, c, bool;
  i:=2;
  c:= Conductor(S);
  e:=Multiplicity(S);
  if IsArf(S) then
    while (S[i]<=2*c-1) do
      bool:=(FengRaoDistance(S,2,S[i])=FengRaoDistanceArf2(S,S[i]));
      Print(bool);
      Print("\t");
      Print(S[i]);
      Print("\t");
      Print(FengRaoDistance(S,2,S[i]));
      Print("\t");
      Print(FengRaoDistanceArf2(S,S[i]));
      Print("\n");
      i:=i+1;
    od;
  fi;
end;
