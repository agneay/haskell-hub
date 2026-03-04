{-# LANGUAGE BangPatterns #-}

import Data.List (maximumBy)
import Data.Map.Strict qualified as M
import Data.Ord (comparing)

collatz :: Integer -> [Integer]
collatz n = n : collatz next
  where
    next
      | even n = n `div` 2
      | otherwise = 3 * n + 1

collatzFinite :: Integer -> [Integer]
collatzFinite 1 = [1]
collatzFinite n = n : collatzFinite next
  where
    next
      | even n = n `div` 2
      | otherwise = 3 * n + 1

collatzLengthMemo :: Integer -> M.Map Integer Int -> (Int, M.Map Integer Int)
collatzLengthMemo 1 memo = (1, M.insert 1 1 memo)
collatzLengthMemo n memo =
  case M.lookup n memo of
    Just len -> (len, memo)
    Nothing ->
      let next = if even n then n `div` 2 else 3 * n + 1
          (lenNext, memo') = collatzLengthMemo next memo
          !len = 1 + lenNext
       in (len, M.insert n len memo')

longestUnderMillion :: (Integer, Int)
longestUnderMillion = go 1 M.empty (1, 1)
  where
    limit = 999999

    go n memo currentMax
      | n > limit = currentMax
      | otherwise =
          let (len, memo') = collatzLengthMemo n memo
              newMax =
                if len > snd currentMax
                  then (n, len)
                  else currentMax
           in go (n + 1) memo' newMax

main :: IO ()
main = do
  putStrLn "First 10 terms of Collatz starting at 27:"
  print $ take 10 (collatz 27)

  putStrLn "\nFinding longest Collatz sequence under 1,000,000..."
  let (num, len) = longestUnderMillion
  putStrLn $ "Number with longest sequence: " ++ show num
  putStrLn $ "Length of sequence: " ++ show len