sumOfSquares :: [Int] -> Int
sumOfSquares = foldr (\x acc -> x * x + acc) 0
