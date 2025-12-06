{-
Write a function fromMaybe that extracts the value from a Maybe type.
If it’s Nothing, return a default value provided as an argument. 
-}

fromMaybe :: a -> Maybe a -> a
fromMaybe d Nothing = d
fromMaybe _ (Just x) = x