module Main where

nextRow :: [Integer] -> [Integer]
nextRow row =
  zipWith (+) ([0] ++ row) (row ++ [0])

pascalsTriangle :: [[Integer]]
pascalsTriangle = iterate nextRow [1]

main :: IO ()
main = do
  putStrLn "First 5 rows of Pascal's Triangle:"
  mapM_ print (take 5 pascalsTriangle)