{-
Implement a Lambda Expression for Filtering 

Write a lambda expression to filter out all even numbers from a list. 

-- Example Usage: 

-- filterEvens [1,2,3,4,5] => [1,3,5] 

-- filterEvens [2,4,6] => [] 
-}

filterEvens :: [Int] -> [Int]
filterEvens xs = filter (\x -> odd x) xs