{-
Filter and Transform: Write a function squareOddNumbers that filters odd numbers
from a list and returns their squares using map and filter.
-}

squareOddNumbers :: [Integer] -> [Integer]
squareOddNumbers x = map (^ 2) $ filter odd x