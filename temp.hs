myDiv :: Int -> Int -> Either String Int
myDiv x y
  | y == 0 = Left "Zero Division"
  | x `mod` y == 0 = Left "Not Exact"
  | otherwise = Right (div x y)