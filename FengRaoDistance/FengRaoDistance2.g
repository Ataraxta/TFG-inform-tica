#####################################################################
##
#O FengRaoDistance(NS,r,m)
##
# Computes the r-th Feng-Rao distance of the element m in the numerical semigroup NS
# function originally implemented by Benjamin Heredia
##

#####################################################################
FengRaoDistance2 := function(s,r,m)
  local  conductor, genus, multiplicity, final, elementsUpToFinal, divisorsOfMany2,
         addOne2, posiblesOfLen2, FengRaoDistanceArf, FengRaoDistanceSymmetric,
         FengRaoDistanceBruteForce, FengRaoDistanceSymmetricGeneralized,
         FengRaoDistanceOrdinary2, FengRaoDistanceArf2, FRD2Small,
          FengRaoDistanceTwoGenerators;

  conductor := ConductorOfNumericalSemigroup(s);
  #Trivial case, when m>=2c-1
  if (m>=2*conductor-1) then
    genus:=GenusOfNumericalSemigroup(s);
    if r=1 then return m+1-2*genus;
    else return m+1-2*genus+FengRaoNumber(r,s);
    fi;
  fi;

  multiplicity := MultiplicityOfNumericalSemigroup(s);
  final := Maximum([m+multiplicity-1,conductor+multiplicity-1]);
  #  elementsUpToFinal := FirstElementsOfNumericalSemigroup(final,s);
  elementsUpToFinal := Intersection([0..final],FirstElementsOfNumericalSemigroup(final+r,s));
  #local functions
  # This function gives the set of divisors of several elements
  divisorsOfMany2 := function(lst)
    return Union(List(lst, x -> DivisorsOfElementInNumericalSemigroup(s,x)));
  end;
  # addOne(s,m,lst) gives back X(m;lst) as in the notes. That is the set used
  # to compute the X^r(m) from X^{r-1}(m).
  addOne2 := function(lst)
    local  prec, pos1, pos2;
    if IsEmpty(lst) then
      return Intersection([m..final],elementsUpToFinal);
    else
      prec := Reversed(lst)[1];
      if (prec<final) then
        pos1 := Intersection([prec+1..final],elementsUpToFinal);
      else
        pos1 := [];
      fi;
      #      pos2 := Filtered(List(lst, x -> x+multiplicity), y -> y>prec);
      pos2 := Filtered(lst+multiplicity, y -> y>prec);
      return Union(pos1,pos2);
    fi;
  end;

  # This functions gives back X^r(m) recursively.
  posiblesOfLen2 := function(r)
    local lst, tot;
    if r = 1 then
      return List(addOne2([]), x -> [x]);
    else
      lst := posiblesOfLen2(r-1);
      tot := List(lst,x -> List(addOne2(x),y -> Concatenation(x,[y])));
      return Union(tot);
    fi;
  end;

  #FengRaoDistanceArf############################################################
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

  #FengRaoDistanceSymmetric###############################
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
      return FengRaoDistance(S,1,m);
    fi;
    Error("Invalid Imput arguments");
  end;

  # Computes the classic Feng Rao distance of m, an element of the numerical    #
  # semigrup S. S must be is generated by 2 Elements                            #
  ###############################################################################
  # This algorithm is besed on the aricle:                                      #
  # On the weight hierarchy of codes coming from semigroups with two generators #
  # Written by:                                                                 #
  # M. Delgado, J. I. Farrán, P. A. Garcı́a-Sánchez and D. Llena                 #
  # Published in:                                                               #
  # IEEE Transactions on information theory, 2013                               #
  ###############################################################################

  FengRaoDistanceTwoGenerators := function(S,m)
    local conductor, genus, ro, p, min, L;
    # We use the formula fr:=min{ρ_k ∈ S | ρ_k ≥ m + 2 - 2g}, for m≥c.
    conductor:=Conductor(S);
    genus:=Genus(S);
    L:=ElementsUpTo(S,2*conductor);
    min:=4*conductor;
    for ro in L do
      if ro >= m+1-2*genus and min>(ro+m+1-2*genus) then
        min:=ro;
      fi;
    od;
    return min;
  end;

  #Computes the generalized r-th Feng-Rao distance for m in the semigrup such that
  #m=2g-1+e for some e in the semigroup.
  #############################################################
  # This formula is based on the article by:                  #
  # Jose Ignacio Farrán and Carlos Munuera                    #
  # Titled:                                                   #
  # Goppa-like bounds for the generalized Feng-Rao distances  #
  # from 2001                                                 #
  # Theorem 9                                                 #
  #############################################################
  FengRaoDistanceSymmetricGeneralized := function(s,r,m)
      return m+1-2*Genus(s)+FengRaoNumber(r,s);
  end;

  #Computes the 2-nd feng rao distance of m, and element of the semigrup s
  #in the interval [c,2c]
  ######################################################################
  #-This is based on Remark 35, on the article:
  # On the second Feng-Rao distance of Algebraic Geometry codes related to Arf
  # semigroups (2018)
  #-whose authors are:
  # José I. Farrán, Pedro A. García-Sánchez and Benjamín A. Heredia
  # Journal:
  # Codes and Cryptography, Volume 86, Number 12, DOI 10.1007/s10623-018-0483-4
  ######################################################################
  FengRaoDistanceOrdinary2 := function(s,m)
    local e, c;
    e:=Multiplicity(s);
    c:=Conductor(s);
    if c<=m and m<2*e-1 then return 3; fi;
    return m - (2*e - 1) + 4;
  end;

  #We compute the second Feng-Rao Distance for Arf semigroups
  #S is a numerical semigroup (Arf) and n is an index (positive integer)
  ######################################################################
  #-This is based on Theorem 29 and 32, on the article:
  # On the second Feng-Rao distance of Algebraic Geometry codes related to Arf
  # semigroups (2018)
  #-whose authors are:
  # José I. Farrán, Pedro A. García-Sánchez and Benjamín A. Heredia
  # Journal:
  # Codes and Cryptography, Volume 86, Number 12, DOI 10.1007/s10623-018-0483-4
  ######################################################################
  #Computes FengRaoDistance for small elements (m<c+e)
  FRD2Small := function(S,m)

    local fr2, e, c, r;
    fr2:=0;
    e := Multiplicity(S);
    c := Conductor(S);
    r:=NumberElement_NumericalSemigroup(S,c);
    if m>=c+e then Error("m must be less or equal to Conductor+Multiplicity"); fi;
    if e=S[2] and e>=2 then
      #First case in the therorem e=2 and m in [2,c+1]
      if e=2 then
        if (2<=m) and (m<=c+1) then
          if m=2 then
             fr2:=3;
          else
            if m>2 then
             fr2:=4;
            fi;
          fi;
        fi;
      else #e>2
        #Case 2, when e>2 and m in [e,c+e-3]
        if (e<=m) and (m<=c+e-3) then
          fr2:=3;
        else
        #Case 3 e>2 and m = c+e-2 or m=c+e-1
          if m=c+e-1 then   # Case m=c+e-1
            if S[3]=2*S[2] then #Case S[3]=2S[2]
               fr2:=4;
            else
              if S[3]<2*S[2] then #Case S[3]<2S[2]
                if r=2 then
                   fr2:=4;
                else # r>2
                   fr2:=5;
                fi;
              fi;
            fi;
          else   # Case m=c+e-2
            if S[3]=2*S[2] then #Case S[3]=2S[2]
              if S[r-1]<c-2 then
                fr2:=3;
              else
                if S[r-1]=c-2 then
                  fr2:=4;
                fi;
              fi;
            else #Case S[3]<S[2]
              if S[r-1]<c-2 then
                fr2:=3;
              else
                if (S[r-1]=c-2) and (r=3) then
                  fr2:=4;
                else
                  if (S[r-1]=c-2) and (r>3) then
                    fr2:=5;
                  fi;
                fi;
              fi;
            fi;
          fi;
        fi;
      fi;
    fi;
    return fr2;
  end;

  #General Case computation, for 2c>m>=c+e

  FengRaoDistanceArf2 := function(S,m)
    local l, mAux, mSeq, fr1, fr2, fr2Seq, r, e, eSeq, c, cSeq,
    k, kAux, kSeq, i,a, sSeq, sAux, rr, multSeq, L;

    mSeq:=[];
    e := Multiplicity(S);
    c := Conductor(S);
    k:=m-c-e;
    r:=NumberElement_NumericalSemigroup(S,c);
    #Check theorem hypothesis e=S[2].
    #Case  m>c+e-1,given by theorem 32
    if m>c+e-1 then
      multSeq := MultiplicitySequence(S);
      #Remove(multSeq,1);
      #Compute S1 sequence of semigroups:
      sAux:=NumericalSemigroup(1);
      sSeq:=[sAux];
      eSeq:=[1];
      cSeq:=[0];
      kSeq:=[m-c-e];
      mSeq:=[m];

      i:=1;
      #STEP 1: Compute semigrup sequence, as well as multiplicity and conductor sequence
      for a in Reversed(multSeq) do
        L:=[0];
        sAux:=a+sAux;
        Append(L,SmallElements(sAux));
        sAux:=NumericalSemigroupBySmallElements(L);

        Add(sSeq,sAux);
        Add(eSeq,Multiplicity(sAux));
        Add(cSeq,Conductor(sAux));
        i:=i+1;
      od;

      #STEP 2: Computing k and m sequences:
      l:=Length(eSeq);
      i:=l;

      while i>1 do
        kAux:=mSeq[1]-cSeq[i]-eSeq[i];
        Add(kSeq,kAux,1);
        mAux:=cSeq[i-1]+kAux;
        Add(mSeq,mAux,1);

        i:=i-1;
      od;

    #STEP 3: Computin second Feng-Rao number
        # a is the position of the first element of mSeq and kSeq with regard to
        # eSeq and cSeq
      l:=Length(sSeq);
      fr2:=mSeq[1]+2;
      for i in [1..l] do

        if (cSeq[i] <= mSeq[i]) and (mSeq[i] < cSeq[i]+eSeq[i]) then
          #Theorem 29 computation
          fr2:=FRD2Small(sSeq[i],mSeq[i]);

        else #Theorem 32 computation
            if i>1 and kSeq[i]>=0 then
              fr1:=FengRaoDistanceArf(sSeq[i-1],mSeq[i-1]+eSeq[i-1]);
              if eSeq[i]=eSeq[i-1] and fr2=fr1 then
                  fr2:=fr2+2;
              else
                  fr2:=fr2+3;
              fi;
            fi;

        fi;
      od;
    else
      ##Print("\nSmall is fault\n");
      return FRD2Small(S,m);
    fi;

    return fr2;
  end;


  #Simple r=1 case, non recursive

  FengRaoDistanceBruteForce :=function(S,m)
    local fr, d, c, g, i, x,n, L;
    n:=NumberElement_NumericalSemigroup(S,m);
    if n=1 then return 2; fi;
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

  if HasIsSymmetric(s) and ((m-2*Genus(s)+1) in s) then
    FengRaoDistanceSymmetricGeneralized(s,r,m);
  fi;

  # end of local functions
  # And here it is the Feng-Rao distance

  #Special cases

  #Classical (r=1)
  if r=1 then
    if HasIsArf(s) and IsArf(s) then
      return FengRaoDistanceArf(s,m);
    fi;

    if HasIsSymmetric(s) and IsSymmetric(s) and m>=conductor then
      return FengRaoDistanceSymmetric(s,m);
    fi;

    if m>=conductor and Size(Generators(s))=2 then
      return FengRaoDistanceTwoGenerators(s,m);
    fi;

    return FengRaoDistanceBruteForce(s,m);

  fi;

  #Generalized, r=2
  if r=2 then

    if HasIsOrdinary(s) and IsOrdinary(s) and r=2 and m>=conductor then
      return FengRaoDistanceOrdinary2(s,m);
    fi;

    if HasIsArf(s) and IsArf(s) then
      return FengRaoDistanceArf2(s,m);
    fi;

  fi;

  #Generalized, symmetric:

  if HasIsSymmetric(s) and IsSymmetric(s) and  ((m-conductor+1) in s) then
    FengRaoDistanceSymmetricGeneralized(s,r,m);
  fi;


  return Minimum(List(posiblesOfLen2(r), d -> Length(divisorsOfMany2(d))));
end;
