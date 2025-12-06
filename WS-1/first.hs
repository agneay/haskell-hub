{-
    Write a function describeList that takes a list and returns: 

 

    "Empty List" if the list is empty 

    "Single Element" if it has exactly one element 

    "Multiple Elements" otherwise 
-}

describeList :: [a] -> String

describeList [] = "Empty List"
describeList [_] = "Single Element"
describeList _ = "Multiple Element"