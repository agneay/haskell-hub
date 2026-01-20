{-
Implement Lazy Evaluation with Closures 
Write a function lazySum that takes two integers but doesn't compute their sum until explicitly requested. 

-- Example Usage: 

-- let result = lazySum 5 10 () 

-- result => 15 (computed only when accessed) 
-}

lazySum :: Int -> Int -> () -> Int
lazySum x y = \() -> x + y
