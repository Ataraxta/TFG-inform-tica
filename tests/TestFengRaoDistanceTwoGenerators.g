TestFengRaoDistanceTwoGenerators := function(S)
  local i, e, c, bool, g;
  c:= Conductor(S);
  e:=Multiplicity(S);
  g:=Genus(S);
  if Length(Generators(S))=2 then
    for i in [c..2*c-2] do
      bool:=(FengRaoDistance(S,1,S[i])=FengRaoDistanceTwoGenerators(S,S[i]));
      Print(bool);
      Print("\t");
      Print("&");
      Print("\t");
      Print(S[i]);
      Print("\t");
      Print("&");
      Print("\t");
      Print(FengRaoDistance(S,1,S[i]));
      Print("\t");
      Print("&");
      Print("\t");
      Print(FengRaoDistanceTwoGenerators(S,S[i]));
      Print("\\\\ \\hline");
      Print("\n");
    od;
  fi;
end;
