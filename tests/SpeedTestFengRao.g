#This test performance differences between the function FengRaoDistance,
#as implemented in version 1.2.2 and the version with improvements. It test
#the function for a semigroup s and r (r-th feng rao distance). It computes the
#feng rao distance for all elements of the semigrup up to the lim-th element.

SpeedTestFengRao := function(s,r,limInf,limSup,verbose,iter)
  local j, i, a, b, t1, t2, averageT, averageA, averageB;
  averageT:=[];
  averageA:=[];
  averageB:=[];
  for j in [1..iter] do
    Add(averageT,0);
    Add(averageA,0);
    Add(averageB,0);
    for i in [limInf..limSup] do
      if i in S then
        a:=NanosecondsSinceEpoch();
        FengRaoDistance(s,r,i);
        b:=NanosecondsSinceEpoch();
        t1:=b-a;
        a:=NanosecondsSinceEpoch();
        FengRaoDistance2(s,r,i);
        b:=NanosecondsSinceEpoch();
        t2:=b-a;
        if verbose then
          Print("\t");
          Print(i);
          Print("\t");
          Print(t1);
          Print("\t");
          Print(t2);
          Print("\t");
          Print("\t");
          Print(t1-t2);
          Print("\n");
        fi;
        averageA[j]:=averageA[j]+t1;
        averageB[j]:=averageB[j]+t2;
        averageT[j]:=averageT[j]+(t1-t2);
      fi;
    od;
    averageT[j]:=Float(averageT[j]/(limSup-limInf));
  od;
  averageA:=Float(Sum(averageA)/iter);
  averageB:=Float(Sum(averageB)/iter);
  averageT:=(Sum(averageT)/iter)/1000000;
  return [averageA/averageB,averageT];
end;
