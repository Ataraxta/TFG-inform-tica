#Takes the values of oplus, in the form of a list of triplets
#O=[(i_1,j_i,Oplus(i_1,j_1)),...,(i_m,j_m,Oplus(i_m,j_m,Oplus(i_m,j_m)))]
SemigroupFromOplus := function(O)
  local S, nu;
  nu:=NuFromOplus(O);
  S:=SemigroupFromNu(nu);
  return S;
end;
