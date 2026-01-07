-- safe Division
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)

-- safe sqare root
safeSqrt :: Int -> Maybe Int
safeSqrt x
  | x < 0 = Nothing
  | otherwise = Just (floor (sqrt (fromIntegral x)))

-- chaining Computations
compute :: Int -> Int -> Maybe Int
compute a b = do
  x <- safeDiv a b
  y <- safeSqrt x
  z <- safeDiv y 2
  return z

main :: IO ()
main = do
  print $ compute 100 5
  print $ compute 100 0
  print $ compute (-4) 2