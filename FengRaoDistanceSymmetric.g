#Computes the Feng Rao distance for a symmetric semigrup.
# If S is a numerical Semigroup and m in an elment of S,
# it returns the classic Feng-Rao distance of m in S.
########################################################
# This algorithm is based on the article by:           #
# Antonio Campillo and Jose Ignacio Farrán. Titled:    #
# Computing Weierstrass semigroups and the             #
# Feng-Rao distance from singular plane models,        #
# from 1999                                            #
# Section 4                                            #
########################################################

FengRaoDistanceSymmetric := function(S,m)
  local g, c, n, nprima, delta, L, i;
  g:=Genus(S);
  c:=Conductor(S);
  #This algorithm is meant for m in [c,2c-1]
  #Simple case, given by theorem 4.6:
  if (m-2*g+1) in S then
    return m+1-2*g;
  fi;
  #From theorem 4.7:
  if (c<=m)  then
    n:=m-c+1;
    nprima:=n;
    while not(nprima in S) do
      nprima:=nprima+1;
    od;
    L:=[nprima];
    delta:=nprima-n;
    for i in [(m)..(m+delta-3)] do
      Add(L,Nu(NumberElement_NumericalSemigroup(S,i),S));
    od;
    return MinimumList(L);
  else
    return FengRaoDistanceBruteForce(S,m);
  fi;
  Error("Invalid Imput arguments");
end;
