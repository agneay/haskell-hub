removeOdds::[Int]->[Int]
removeOdds ls = [a | a<-ls, a `mod` 2 == 0]
