incrementNested :: [Maybe Int] -> [Maybe Int]
incrementNested = fmap (fmap (+ 1))

main :: IO ()
main = do
  print $ incrementNested [Just 1, Nothing, Just 3]