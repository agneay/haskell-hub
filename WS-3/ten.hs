import System.Win32 (xBUTTON1)

{-
Recursive Count Elements: Write a function countElements that counts the number
of elements in a list recursively.
-}

countElements :: [Int] -> Int
countElements [] = 0
countElements (x : xs) = 1 + countElements xs