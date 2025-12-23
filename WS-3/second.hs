{-
Filter Even Numbers: Write a function onlyEvens that takes a list of integers and
returns only even numbers using filter.
-}

isEven :: Integer -> Bool
isEven x = x `mod` 2 == 0

onlyEvens :: [Integer] -> [Integer]
onlyEvens x = filter (isEven) x