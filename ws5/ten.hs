{-
Implement Infinite List Generation (iterate). Write a function myIterate that generates an infinite list by repeatedly applying a function to an initial value.
myIterate :: (a -> a) -> a -> [a]
-}

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)
