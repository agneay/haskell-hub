-- EitherFunctor.hs

-- No need to define Either.
-- It already has a Functor instance in Prelude.

-- Test functions
square :: Int -> Int
square x = x * x

increment :: Int -> Int
increment x = x + 1

main :: IO ()
main = do
  let rightValue = Right 5 :: Either String Int
  let leftValue = Left "Error" :: Either String Int

  putStrLn "Applying square to Right 5:"
  print (fmap square rightValue)
  -- Expected: Right 25

  putStrLn "\nApplying square to Left \"Error\":"
  print (fmap square leftValue)
  -- Expected: Left "Error"

  putStrLn "\nUsing <$> operator:"
  print (increment <$> rightValue)
  -- Expected: Right 6

  print (increment <$> leftValue)

-- Expected: Left "Error"