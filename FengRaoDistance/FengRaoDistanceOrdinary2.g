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
