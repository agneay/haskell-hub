{-
Convert String to Title Case: Write a function toTitleCase that capitalizes the first
letter of each word in a list of strings using map.
-}

import Data.Char (toUpper)

toTitleCase :: [[Char]] -> [[Char]]
toTitleCase = map capitalize
  where
    capitalize [] = []
    capitalize (x : xs) = toUpper x : xs