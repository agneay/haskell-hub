{-
 Recursive Reverse: Write a function reverseList that reverses a list using
recursion
-}

reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList (x : xs) = (reverseList xs ++) [x]
