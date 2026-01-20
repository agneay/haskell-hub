{-
Use Lambdas to Transform Lists 
Write a function transformList that uses lambdas to square all numbers in a list and then adds 1 to each. 
-- Example Usage: 

-- transformList [1,2,3] => [2,5,10] 

-- transformList [0,-1,-2] => [1,2,5] 
-}

transformList :: [Int] -> [Int]
transformList xs = map (\x -> x^2+1) xs