TestFengRaoDistanceSymmetricGeneralized:= function(S,r)
  local i, e, g, c, bool;
  c:= Conductor(S);
  e:=Multiplicity(S);
  g:=Genus(S);
  if IsSymmetric(S) then
    for i in [2..2*c-1] do
      if (S[i]-2*g+1) in S then
        bool:=(FengRaoDistance(S,r,S[i])=FengRaoDistanceSymmetricGeneralized(S,r,S[i]));
        Print(bool);
        Print("\t");
        Print("&");
        Print("\t");
        Print(S[i]);
        Print("\t");
        Print("&");
        Print("\t");
        Print(FengRaoDistance(S,r,S[i]));
        Print("\t");
        Print("&");
        Print("\t");
        Print(FengRaoDistanceSymmetricGeneralized(S,r,S[i]));
        Print("\\\\ \\hline");
        Print("\n");
      fi;
    od;
  fi;
end;
