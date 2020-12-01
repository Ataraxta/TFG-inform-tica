#Calculates nu sequence of semigroup, up to nu_i=2c-g.
#For numbers greater than that, it increases 1 by 1.
NuSequence:=S->List([1..2*Conductor(S)-Genus(S)],
    i->Nu(i,S));
