{-
Find Strings of Given Length: Write a function filterByLength that filters strings
with length greater than a given number using filter.
-}

filterByLength :: String -> Int -> String
filterByLength x n = unwords $ filter (\w -> length w > n) $ words x