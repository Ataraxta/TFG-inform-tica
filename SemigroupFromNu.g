#Given a Nu sequence, compute the semigroup asociated to it.
SemigroupFromNu := function(NuSeq)
  local isNu, i, l, S, g, c, k, G, DTilde;
  #Some checks on sequence. This are only necesary Conditions for a Nu sequence
  isNu:=true;
  l:=Size(NuSeq);
  if l>0 then
    if not(NuSeq[1]=1) then isNu:=false; fi;
    if l>1 then
      if not(NuSeq[2]=2) then isNu:=false; fi;
    else #If nu sequece is [1], then the semigroup is N
      return NumericalSemigroup(1);
    fi;
    for i in [1..l] do
      if not(NuSeq[i]<=i) then isNu:=false; fi;
    od;
  fi;
  if not isNu then
    Print("Not a valid Nu sequence\n");
    return fail;
  else
  #We compute numerical semigroup from NuSeq.
  #This Semigroup may not unique if nu sequence is not complete.
    S:=[];
    #We first need to compute k, greatest i such that nu_i=nu_{i+1}
    k:=1;
    for i in [1..(l-1)] do
      if NuSeq[i]=NuSeq[i+1] then
        k:=i;
      fi;
    od;
    #With k, we can calculate both Genus and Conductor
    g:=k+1-NuSeq[k];
    c:=(k+g+1)/2;

    #We keep track of gaps.
    #Note that 1 is gap, since the trivial semigroup was already conseidered.
    G:=[1,c-1];

    #This auxiliar function computes the number of gaps, l, i<l<c-1 such that:
    #c-1+i-l is also a Gap
    DTilde:=function(i,c,G)
      local l, D;
      D:=0;
      for l in [(i+1)..(c-3)] do
        if l in G then
          if (c+i-l-1) in G then D:=D+1; fi;
        fi;
      od;
      return D;
    end;

    for i in Reversed([2..(c-1)]) do
      if NuSeq[c+i-g]=(c+i-2*g+DTilde(i,c,G)) then
        Add(S,i);
      else
        Add(G,i);
      fi;
    od;
    #Now, we determine small elements of the semigroup.
    Add(S,0); # O is always n the semigroup.
    Sort(S);
    Add(S,c); # Conductor is always n the semigroup.
    return NumericalSemigroupBySmallElements(S);
  fi;
end;
