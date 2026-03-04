import ChatADT

main :: IO ()
main = do
  let room0 = emptyChatRoom
  let room1 = addUser room0 "Alice"
  let room2 = addUser room1 "Bob"

  let room3 = sendMessage room2 "Alice" ("Alice", "Hello Bob!")
  let room4 = sendMessage room3 "Bob" ("Bob", "Hi Alice!")

  mapM_ print (fetchMessages room4)