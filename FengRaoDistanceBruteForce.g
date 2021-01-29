#Computes classical FengRaoDistance computing the minimum.
FengRaoDistanceBruteForce :=function(S,m)
  local fr, d, c, g, i, x,n, L;
  n:=NumberElement_NumericalSemigroup(S,m);
  if n=1 then return 1; fi;
  c:=Conductor(S);
  g:=Genus(S);
  L:=NuSequence(S);
  if n<2*c-g then
    L:=L{[n..(2*c-g)]};
    fr:=MinimumList(L);
  else
    fr:=m-2*g+1;
  fi;
  return fr;

end;
#L:=S{[n..(2*c-g+1)]};
#for x in L do
#  if x>=m+1-2*g then Add(L1,x); fi;
#od;
#fr:=MinimumList(L1);
