#Checks if a given sequence is a Nu Sequence.
IsNu := function(NuSeq)
  local s;
  s:=SemigroupFromNu(NuSeq);
  return (NuSequence(s)<=nuSeq);
end;
