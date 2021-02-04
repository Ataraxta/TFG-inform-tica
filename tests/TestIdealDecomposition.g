TestIdealDecomposition := function()
 local l,aux,L1, I1,I2, k, i, j, a;
 l:=List([1..20],_->RandomNumericalSemigroup(5,10,50));;
 for i in [1..20] do
   L1:=[];
   k:=Random(1,5);
   for j in [1..k] do
     a:=Random(-15,15);
     while (a in L1) do
       a:=Random(-15,15);
     od;
     Add(L1,a);
   od;
   Sort(L1);
   I1:=L1+l[i];
   L1:=MinimalGenerators(I1);
   I1:=L1+l[i];
   aux:=IdealDecomposition(I1);
   I2:=aux[1];
   for j in [2..Length(aux)] do
     I2:=IntersectionIdealsOfNumericalSemigroup(I2,aux[j]);
   od;
   if not (I1=I2) then return fail; fi;
 od;
 return "success";
end;
