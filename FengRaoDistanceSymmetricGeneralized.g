#Computes the generalized r-th Feng-Rao distance for m in the semigrup such that
#m=2g-1+e for some e in the semigroup.
#############################################################
# This algorithm is based on the article by:                #
# Jose Ignacio Farrán and Carlos Munuera                    #
# Titled:                                                   #
# Goppa-like bounds for the generalized Feng-Rao distances  #
# from 2001                                                 #
# Theorem 9                                                 #
#############################################################
FengRaoDistanceSymmetricGeneralized := function(s,r,m)
  if (m-2*g+1) in s then
    return m+1-2*g+FengRaoNumber(r,s);
  fi;
end
