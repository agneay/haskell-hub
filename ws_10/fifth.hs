import Data.List (isInfixOf)

main :: IO()
main = do
  putStrLn "Enter a word to search:"
  word <- getLine

  contents <- readFile "data.txt"
  if word `isInfixOf` contents then putStrLn "The word exists in data.txt" else putStrLn "The word was not found in data.txt"
