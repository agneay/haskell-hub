{-
    Count Elements Matching a Predicate. 
    Write a function countIf that counts how many elements in a list satisfy a given predicate. 
countIf :: (a -> Bool) -> [a] -> Int 
-}

countIf :: (a->Bool)->[a]->Int
countIf _ [] = 0
countIf f (x:xs) 
    | f x = 1 + countIf f xs
    | otherwise = countIf f xs