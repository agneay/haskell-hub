{-
Implement Function Composition for a List of Functions 
Write a function composeList that takes a list of functions and composes them from right to left. 
Expected Signature and Output: 
composeList :: [a -> a] -> (a -> a) composeList [(+1), (*2), (^2)] 3 -- Output: 19 
-- Explanation: 3^2 = 9, 9*2 = 18, 18+1 = 19 
-}

composeList :: [a->a]-> (a->a)
composeList fs = foldr (\f acc -> f.acc) id fs