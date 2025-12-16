squareEvens :: [Int]->[Int]
squareEvens ls = [a^2| a<-ls,a `mod` 2 == 0]
