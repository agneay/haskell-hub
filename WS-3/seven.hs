{-
 Recursive Factorial: Write a function factorial that computes the factorial of a
number using recursion.
-}

factorial :: Int -> Int
factorial x
  | x == 0 = 1
  | otherwise = x * factorial (x - 1)