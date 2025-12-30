{-
    Implement a Function to Check for Duplicates. 
    Write a function hasDuplicates that checks if there are duplicate elements in a list. 
hasDuplicates :: Eq a => [a] -> Bool 
-}

hasDuplicates :: (Eq a)=> [a] -> Bool
hasDuplicates [] = False
hasDuplicates (x:xs) 
  | x `elem` xs  = True
  | otherwise = hasDuplicates xs