#New function of NumericalSgps, dute to be released in future version of package.
IdealByDivisorClosedSet:=function(X,S)
    local i, gens, ap, m;

    if not(IsNumericalSemigroup(S)) then
        Error("The second argument must be a numerical semigroup");
    fi;
    
    ap:=List(AperyList(S));
    m:=Multiplicity(S);
    for i in [1..m] do
        if ap[i] in X then
            while ap[i] in X do
                ap[i]:=ap[i]+m;
            od;
        fi;
    od;
    return ap+S;
end;
