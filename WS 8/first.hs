module Main where

import Data.Char (isAlpha, toLower)
import Data.List (sortOn)
import Data.Map.Strict qualified as M
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [fileName] -> do
      contents <- readFile fileName -- Lazy IO
      let wordList = normalize contents
          freqMap = buildFrequency wordList
          top10 = take 10 (reverse (sortOn snd (M.toList freqMap)))

      mapM_ printWord top10
    _ -> putStrLn "Usage: runhaskell WordFrequency.hs <filename>"

-- Normalize text into clean lowercase words
normalize :: String -> [String]
normalize =
  words
    . map cleanChar
    . map toLower
  where
    cleanChar c
      | isAlpha c = c
      | otherwise = ' '

-- Build frequency map
buildFrequency :: [String] -> M.Map String Int
buildFrequency =
  foldl (\acc w -> M.insertWith (+) w 1 acc) M.empty

-- Pretty print
printWord :: (String, Int) -> IO ()
printWord (w, c) =
  putStrLn (w ++ " : " ++ show c)