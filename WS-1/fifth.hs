{-
    Write a function countEvens that counts the number of even numbers 
    in a list using pattern matching and recursion. 
-}

countEvens :: [Int] -> Int
countEvens [] = 0
countEvens (x:xs)
  | even x = 1 + countEvens xs 
  | otherwise = countEvens xs