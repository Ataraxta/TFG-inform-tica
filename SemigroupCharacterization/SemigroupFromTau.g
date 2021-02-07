#Given a Tau sequence, it gives outputs the coresponding numerical semigroup.
#In orther for this to be correct, the Tau sequece must contain at least 2c-g+1 items
SemigroupFromTau := function(TauSeq)
  local i, j, k, l, FoundNewMin, g, c, S, aux, min;
  #The first step is to compute the minumun integer, k, such that for all i,
  #Tau_{k+2i}=Tau_{k+2i+1} and Tau_{k+2i+2}=Tau_{k+2i+1}+1.
  l:=Length(TauSeq);
  k:=l-1;
  for j in Reversed([1..l]) do
    FoundNewMin:=true;
    for i in [0..Int((l-j)/2-2)] do

      FoundNewMin:=(TauSeq[j+2*i]=TauSeq[j+2*i+1]) and
        (TauSeq[j+2*i+1]+1=TauSeq[j+2*i+2]) ;

      if not FoundNewMin then break; fi; #Break out of the inner loop
    od;
    if FoundNewMin then k:=j; fi;
  od;
  #With this, we have the conductor and genus
  c:=k-TauSeq[k];
  g:=k-2*TauSeq[k]-1;

  #Now, we compute the semigrup.
  #We need initialize it to a list of lenght l
  S:=[];
  for i in [1..(c-g)] do Add(S,0); od; #The first values don't matter now, but will matter later
  for i in [(c-g)..l] do Add(S,i+g); od; #The values after the conductor are tivial

  for i in Reversed([2..c-g]) do
    #Follow the procedure, as outlined in the proof by Maria Brass
    aux:=Positions(TauSeq,i-1);
    min:=1;
    for j in [1..Length(aux)] do
        if S[aux[min]]>(S[aux[j]]) then
          min:=j;
        fi;
    od;
    S[i]:=S[aux[min]]/2;
  od;
  return NumericalSemigroupBySmallElements(S{[1..(c-g+1)]});
end;
