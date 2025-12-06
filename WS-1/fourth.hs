{-
    Implement a function sumFirstTwo that returns the sum of the first two elements 
    of a list. If the list has fewer than two elements, return 0. 
-}

sumFirstTwo :: [Int] -> Int
sumFirstTwo [] = 0
sumFirstTwo [_] = 0
sumFirstTwo (x:y:xs) = x + y