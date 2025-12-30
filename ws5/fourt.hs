{-
    Implement iterate Using Lazy Evaluation. 
    Write a function myIterate that mimics iterate using lazy evaluation. 
    Expected Signature and Output: 
    myIterate :: (a -> a) -> a -> [a] 
    take 5 (myIterate (*2) 1) -- Output: [1,2,4,8,16] 
-}

myIterate :: (a->a) -> a -> [a]
myIterate f x = x : myIterate f (f x) 








