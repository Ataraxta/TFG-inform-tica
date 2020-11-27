#This function provides the decomposition of an ideal in Z-irreducible componentes
#It takes as imput the ideal of a numerical semigroup and putputs the decomposition.
IdealDecomposition := function(I,S)
    local K, MG, output, g;
    K:=CanonicalIdeal(S);
    MG:=K-I;
    MG:=MinimalGenerators(MG);
    output:=[];
    for g in MG do
      Add(output, g+K);
    od;
    return output;
end;
