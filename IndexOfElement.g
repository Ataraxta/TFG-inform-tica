#Given an element of a semigroup and that semigroup, returns the position of the element.
#0 has index 1.
#If the element is not in the semigroup, it fails
IndexOfElement := function(e,S)
  local i, s;
  i:=1;
  for x in S do
    if x=e then
      return i;
    fi;
    if x>e then
      Print("Element \"");
      Print(e);
      Print("\", does not belong to the semigroup\n");
      return fail;
    fi;
    i:=i+1;
  od;
end;
