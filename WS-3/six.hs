{-
Recursive Sum: Write a function sumRecursive that calculates the sum of a list
using recursion
-}

sumRecursive :: [Integer] -> Integer
sumRecursive [] = 0
sumRecursive (x : xs) = x + sumRecursive xs