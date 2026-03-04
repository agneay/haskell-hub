main :: IO()

main = do
  contents <- readFile "lines.txt"
  let lineList = lines contents
  let lineCount = length lineList
  putStrLn ("Number of lines: " ++ show lineCount)
