#S must be an Arf numerical semigroup (IsArf(s) is true)                      #
#m is an element of S, computes the classic Feng Rao                          #
# Distance of m in S.                                                         #
###############################################################################
# This algorithm is based on the article:                                     #
# On the parameters of algebraic geometry codes related to Arf semigroups     #
# Written by:                                                                 #
# Antonio Campillo , José Ignacio Farrán and Carlos Munuera                   #
# Published in:                                                               #
# IEEE Transactions on information theory, year 2000                          #
###############################################################################

FengRaoDistanceArf := function(S,m)
  local c, r, i, l1, l2, n;
  n:=NumberElement_NumericalSemigroup(S,m)-1;
  c:=Conductor(S);
  r:=NumberElement_NumericalSemigroup(S,c);
  #if m>2*c-1 then return m+1-2*Genus(S); fi;
  if n=0 then return 1; fi;
  if ( (c+r-2) <= n) then
    return n-Genus(S)+1;
  else
    #i=1
    l1:=0;
    l2:=r+S[2]-2;
    if (l1<n) and (n<=l2) then
      return 2;
    else
      for i in [2..(r-1)] do
        l1:=l2;
        l2:=r+S[i+1]-2;
        if (l1<n) and (n<=l2) then
          return 2*i;
        fi;
      od;
    fi;
  fi;
end;
