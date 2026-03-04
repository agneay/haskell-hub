main :: IO()
main = do
  contents <- readFile "source.txt"
  writeFile "destination.txt" contents
  putStrLn "File copied successfully to destination.txt"
