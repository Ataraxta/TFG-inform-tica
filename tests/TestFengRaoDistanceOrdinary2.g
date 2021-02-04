TestFengRaoDistanceOrdinary2 := function(S)
  local i, e, c, bool;
  c:= Conductor(S);
  e:=Multiplicity(S);
  if IsOrdinary(S) then
    for i in [c..2*c-2] do
      bool:=(FengRaoDistance(S,2,S[i])=FengRaoDistanceOrdinary2(S,S[i]));
      Print(bool);
      Print("\t");
      Print("&");
      Print("\t");
      Print(S[i]);
      Print("\t");
      Print("&");
      Print("\t");
      Print(FengRaoDistance(S,2,S[i]));
      Print("\t");
      Print("&");
      Print("\t");
      Print(FengRaoDistanceOrdinary2(S,S[i]));
      Print("\\\\ \\hline");
      Print("\n");
    od;
  fi;
end;
