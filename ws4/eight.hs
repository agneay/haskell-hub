safeDiv :: Int -> Int -> Either String Int
safeDiv _ 0 = Left "Division by zero is not allowed"
safeDiv x y = Right (x `div` y)

compute :: Int -> Int -> Either String Int
compute a b = do
  x <- safeDiv a b
  y <- safeDiv x 2
  return y

main :: IO ()
main = do
  print $ compute 100 5
  print $ compute 100 0
  print $ compute 3 2