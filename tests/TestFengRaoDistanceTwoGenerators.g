TestFengRaoDistanceTwoGenerators := function(S)
  local i, e, c, bool, g;
  c:= Conductor(S);
  e:=Multiplicity(S);
  g:=Genus(S);
  if Length(Generators(S))=2 then
    for i in [(c-g+1)..(2*c-g)] do
      bool:=(FengRaoDistance(S,1,S[i])=FengRaoDistanceTwoGenerators(S,S[i]));
      Print(bool);
      Print("\t");
      Print(i);
      Print("\t");
      Print(FengRaoDistance(S,1,S[i]));
      Print("\t");
      Print(FengRaoDistanceTwoGenerators(S,S[i]));
      Print("\n");
    od;
  fi;
end;
