TestSemigroupFromTau := function()
 local l, s, last;
 l:=List([1..20],_->RandomNumericalSemigroup(5,10,100));;
 s:=First(l, s->not(s=SemigroupFromTau(TauSequence(s))));
 Print(s);
end;
