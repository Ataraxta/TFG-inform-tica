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
FengRaoDistanceArf2 := function(S,m)
  local l, mAux, mSeq, fr1, fr2, fr2Seq, r, e, eSeq, c, cSeq,
  k, kAux, kSeq, i,a, sSeq, sAux, rr, multSeq, L, FRD2Small;


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
