#This test performance differences between the function FengRaoDistance,
#as implemented in version 1.2.2 and the version with improvements. It test
#the function for a semigroup s and r (r-th feng rao distance). It computes the
#feng rao distance for all elements of the semigrup up to the lim-th element.

SpeedTestFengRao := function(s,r , lim)
  local i, a, b, t1, t2;

  for i in [2..lim] do
    a:=NanosecondsSinceEpoch();
    FengRaoDistance(s,r,s[i]);
    b:=NanosecondsSinceEpoch();
    t1:=b-a;
    a:=NanosecondsSinceEpoch();
    FengRaoDistance2(s,r,s[i]);
    b:=NanosecondsSinceEpoch();
    t2:=b-a;
    Print("\t");
    Print(s[i]);
    Print("\t");
    Print(t1);
    Print("\t");
    Print(t2);
    Print("\t");
    Print("\t");
    Print(t1-t2);
    Print("\n");
  od;
end;
