multiplesOfN :: Int -> Int -> [Int]
multiplesOfN n m = [n * x | x <- [1 .. m]]