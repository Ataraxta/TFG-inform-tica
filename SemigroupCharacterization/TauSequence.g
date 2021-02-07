#Calculates Tau sequence of semigroup, up to Tau_i=2c-g+1.
#For numbers greater than that, it increases 1 by 1, every 2.
#Tau_{2c-g+1}=Tau_{2c-g+2}
#For n=0,1,... We have that Tau_{2c-g+1+2n}=Tau_{2c-g+2+2n}=Tau_{2c-g+1}+n
TauSequence:=S->List([1..(2*Conductor(S)-Genus(S)+1)],
    i->TauSemigroup(i,S));
