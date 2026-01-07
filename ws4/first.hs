-- Write a function that safely divides two numbers using the Maybe monad.

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)