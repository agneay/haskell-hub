{-
Recursive Fibonacci: Write a function fibonacci that computes the nth Fibonacci
number using recursion.
-}

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)