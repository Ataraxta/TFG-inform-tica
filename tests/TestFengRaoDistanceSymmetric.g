TestFengRaoDistanceSymmetric := function(S)
  local i, e, c, bool;
  c:= Conductor(S);
  e:=Multiplicity(S);
  if IsSymmetric(S) then
    for i in [c..(2*c-1)] do
      bool:=(FengRaoDistance(S,1,S[i])=FengRaoDistanceSymmetric(S,S[i]));
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
      Print(FengRaoDistanceSymmetric(S,S[i]));
      Print("\\\\ \\hline");
      Print("\n");
    od;
  fi;
end;
