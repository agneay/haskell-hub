import System.IO

main :: IO()
main = do
  content <- readFile "input.txt"
  let newLine = "This is the appended Line"
  let updatedContents = content ++ "\n" ++ newLine
  writeFile "output.txt" updatedContents

