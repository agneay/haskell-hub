main :: IO()
main = do
  putStrLn "Please enter some text: "
  userText <- getLine
  writeFile "user_input.txt" userText
  putStrLn "Your text has been saved to user_input.txt"

