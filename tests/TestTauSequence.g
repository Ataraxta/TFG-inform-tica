TestTauSequence := function()
  local s1, s2, tau1, tau2;
  s1:=NumericalSemigroup(4,5);
  #Asociated tau sequence to s1, calculated in the article by Maria Bras-Amorós
  tau1:=[0, 0, 0, 1, 1, 2, 1, 2, 2, 2, 3, 3, 4, 4, 5, 4, 5, 5, 6];
  s2:=NumericalSemigroup(6,7,8,17);
  #Asociated nu sequence to s2, calculated in the article by Maria Bras-Amorós
  tau2:=[0, 0, 0, 0, 1, 1, 2, 2, 3, 0, 1, 2, 3, 3, 3, 3, 4];
  Print("\n tau1="); Print(tau1); Print("\n");
  Print("\n TauSequence(s1)="); Print(TauSequence(s1)); Print("\n");
  Print("\n ¿TauSequence(s1)=tau1? "); Print(tau1=TauSequence(s1)); Print("\n");
  Print("\n tau2="); Print(tau2); Print("\n");
  Print("\n TauSequence(s2)="); Print(TauSequence(s2)); Print("\n");
  Print("\n ¿TauSequence(s2)=tau2? "); Print(tau2=TauSequence(s2)); Print("\n");
end;
