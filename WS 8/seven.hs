module Main where

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
  | x <= y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

lazyMergeSort :: [Int] -> [Int]
lazyMergeSort [] = []
lazyMergeSort [x] = [x]
lazyMergeSort xs =
  merge (lazyMergeSort left) (lazyMergeSort right)
  where
    (left, right) = splitAt (length xs `div` 2) xs

main :: IO ()
main = do
  let unsorted = [10, 9 .. 1] -- descending list
  putStrLn "First 5 elements of sorted list:"
  print $ take 5 (lazyMergeSort unsorted)

  putStrLn "\nFully sorted list:"
  print $ lazyMergeSort unsorted