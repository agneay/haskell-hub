{-
Increment All Elements: Write a function incrementList that takes a list of
integers and increments each element by 1 using map.
-}

incrementList :: [Integer] -> [Integer]
incrementList x = map (+ 1) x