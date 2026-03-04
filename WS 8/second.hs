module Main where

import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs

  case args of
    [] -> putStrLn "Usage: runhaskell MergeFiles.hs <file1> <file2> ..."
    filePaths -> do
      contents <- mapM readFile filePaths -- Lazy reading
      let lineLists = map lines contents
          merged = mergeLineByLine lineLists

      writeFile "merged.txt" (unlines merged)
      putStrLn "Files merged successfully into merged.txt"

-- Merge multiple lists line by line
mergeLineByLine :: [[String]] -> [String]
mergeLineByLine [] = []
mergeLineByLine lists
  | all null lists = []
  | otherwise =
      let firstLines = [head xs | xs <- lists, not (null xs)]
          remaining = [tail xs | xs <- lists, not (null xs)]
       in firstLines ++ mergeLineByLine remaining