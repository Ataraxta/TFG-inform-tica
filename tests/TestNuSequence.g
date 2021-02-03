TestNuSequence := function()
  local s1, s2, nu1, nu2;
  s1:=NumericalSemigroup(4,5);
  #Asociated nu sequence to s1, calculated in the article by Maria Bras-Amorós
  nu1:=[1, 2, 2, 3, 4, 3, 4, 6, 6, 4, 5, 8, 9, 8, 9, 10, 12, 12];
  s2:=NumericalSemigroup(6,7,8,17);
  #Asociated nu sequence to s2, calculated in the article by Maria Bras-Amorós
  nu2:=[1, 2, 2, 2, 3, 4, 5, 4, 3, 2, 4, 6, 8, 8, 8, 8];
  Print("\n nu1="); Print(nu1); Print("\n");
  Print("\n NuSequence(s1)="); Print(NuSequence(s1)); Print("\n");
  Print("\n ¿NuSequence(s1)=nu1? "); Print(nu1=NuSequence(s1)); Print("\n");
  Print("\n nu2="); Print(nu2); Print("\n");
  Print("\n NuSequence(s2)="); Print(NuSequence(s2)); Print("\n");
  Print("\n ¿NuSequence(s2)=nu2? "); Print(nu2=NuSequence(s2)); Print("\n");
end;
