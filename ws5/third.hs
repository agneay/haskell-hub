{-
Implement scanl Using foldl. 
Write your own version of scanl, which produces intermediate results of foldl. 
Expected Signature and Output: 
myScanl :: (b -> a -> b) -> b -> [a] -> [b] 
myScanl (+) 0 [1,2,3,4] -- Output: [0,1,3,6,10] 
-}

myScanl :: (b -> a -> b) -> b -> [a] -> [b]
myScanl f init xs =
  reverse (foldl step [init] xs)
  where
    step acc x =
      let current = head acc
      in f current x : acc
