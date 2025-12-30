{-
    Implement map Using foldr. myMap :: (a -> b) -> [a] -> [b] 
    myMap (*2) [1,2,3,4] -- Output: [2,4,6,8] 
    Without using the built-in map function, implement it using foldr.. 
-}

myMap :: (a->b)->[a]->[b]
myMap f = foldr (\x acc -> f x:acc) []