{-

Implement a function safeHead using pattern matching that returns
 Just the first element of a list or Nothing if the list is empty
-}

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x