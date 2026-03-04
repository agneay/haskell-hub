module Main where

import Data.Char (isDigit)
import Data.Function (on)
import Data.List
import Data.Map.Strict qualified as M
import System.Environment (getArgs)

extractHour :: String -> Maybe String
extractHour line =
  case dropWhile (/= '[') line of
    ('[' : rest) ->
      let timestamp = takeWhile (/= ']') rest
          afterDate = dropWhile (/= ':') timestamp
       in case drop 1 afterDate of
            (h1 : h2 : _) -> Just [h1, h2]
            _ -> Nothing
    _ -> Nothing

extractPath :: String -> Maybe String
extractPath line =
  case dropWhile (/= '"') line of
    ('"' : rest) ->
      let ws = words rest
       in if length ws >= 2
            then Just (ws !! 1)
            else Nothing
    _ -> Nothing

extractStatus :: String -> Maybe Int
extractStatus line =
  case words line of
    ws
      | length ws >= 2 ->
          let status = ws !! (length ws - 2)
           in if all isDigit status
                then Just (read status)
                else Nothing
    _ -> Nothing

countOccurrences :: (Ord a) => [a] -> M.Map a Int
countOccurrences =
  foldl' (\acc x -> M.insertWith (+) x 1 acc) M.empty

requestsPerHour :: [String] -> M.Map String Int
requestsPerHour logs =
  countOccurrences [h | Just h <- map extractHour logs]

commonPaths :: [String] -> [(String, Int)]
commonPaths logs =
  sortBy (flip compare `on` snd) $
    M.toList $
      countOccurrences [p | Just p <- map extractPath logs]

errorCount :: [String] -> Int
errorCount logs =
  length [s | Just s <- map extractStatus logs, s >= 400]

main :: IO ()
main = do
  args <- getArgs
  case args of
    [fileName] -> do
      contents <- readFile fileName -- Lazy IO
      let logLines = lines contents

      putStrLn "\nRequests per Hour:"
      print (requestsPerHour logLines)

      putStrLn "\nTop 5 Request Paths:"
      print (take 5 (commonPaths logLines))

      putStrLn "\nTotal Error Responses (4xx & 5xx):"
      print (errorCount logLines)
    _ -> putStrLn "Usage: runhaskell four.hs <logfile>"