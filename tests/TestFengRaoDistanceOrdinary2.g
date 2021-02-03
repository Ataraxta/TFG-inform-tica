TestFengRaoDistanceOrdinary2 := function(S)
  local i, e, c, bool;
  c:= Conductor(S);
  e:=Multiplicity(S);
  if IsOrdinary(S) then
    for i in [2..(c+e-1)+10] do
      bool:=(FengRaoDistance(S,1,S[i])=FengRaoDistanceOrdinary2(S,S[i]));
      Print(bool);
      Print("\t");
      Print(i);
      Print("\t");
      Print(FengRaoDistance(S,1,S[i]));
      Print("\t");
      Print(FengRaoDistanceOrdinary2(S,S[i]));
      Print("\n");
    od;
  fi;
end;
