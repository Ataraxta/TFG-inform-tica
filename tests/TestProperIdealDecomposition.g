TestProperIdealDecomposition := function()
 local l,aux,L1, I1,I2, k, i, j, a;
 l:=List([1..20],_->RandomNumericalSemigroup(5,10,50));;
 for i in [1..20] do
   L1:=[];
   I1:=-1+l[i];
   while not(IsIntegral(I1)) do
     k:=Random(1,5);
     for j in [1..k] do
       a:=Random(Conductor(l[i]),10*Conductor(l[i]));
       while (a in L1) do
         a:=Random(Conductor(l[i]),10*Conductor(l[i]));
       od;
       Add(L1,a);
     od;
     Sort(L1);
     I1:=L1+l[i];
   od;
   aux:=ProperIdealDecomposition(I1);
   I2:=Intersection(aux);
   if not (I1=I2) then return fail; fi;
 od;
 return "success";
end;
