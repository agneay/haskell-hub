{-
    Implement a Custom Zip Function with a Given Operator. Write a function customZipWith that behaves like zipWith, but takes an operator as an argument. 
    Expected Signature and Output: 
    customZipWith :: (a -> b -> c) -> [a] -> [b] -> [c] 
    customZipWith (+) [1,2,3] [4,5,6] -- Output: [5,7,9] 
-}

customZipWith :: (a->b->c) -> [a] -> [b] -> [c]
customZipWith _ _ [] = []
customZipWith _ [] _ = []
customZipWith f (x:xs) (y:ys) = f x y : customZipWith f xs ys


 
