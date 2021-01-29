TestFengRaoDistanceSymmetric := function(S)
  local i, e, c, bool;
  c:= Conductor(S);
  e:=Multiplicity(S);
  if IsSymmetric(S) then
    for i in [2..(c+e-1)+10] do
      bool:=(FengRaoDistance(S,1,S[i])=FengRaoDistanceSymmetric(S,S[i]));
      Print(bool);
      Print("\t");
      Print(i);
      Print("\t");
      Print(FengRaoDistance(S,1,S[i]));
      Print("\t");
      Print(FengRaoDistanceSymmetric(S,S[i]));
      Print("\n");
    od;
  fi;
end;
