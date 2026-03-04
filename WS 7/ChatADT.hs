module ChatADT
  ( ChatRoom,
    User,
    Message,
    emptyChatRoom,
    addUser,
    removeUser,
    sendMessage,
    fetchMessages,
  )
where

-- Public domain types
type User = String

type Message = (User, String)

-- Internal representation (hidden)
data ChatRoom = ChatRoom
  { users :: [User],
    messages :: [Message]
  }

-- Create an empty chat room
emptyChatRoom :: ChatRoom
emptyChatRoom = ChatRoom [] []

-- Add a user (no duplicates)
addUser :: ChatRoom -> User -> ChatRoom
addUser (ChatRoom us msgs) user
  | user `elem` us = ChatRoom us msgs
  | otherwise = ChatRoom (user : us) msgs

-- Remove a user
removeUser :: ChatRoom -> User -> ChatRoom
removeUser (ChatRoom us msgs) user =
  ChatRoom (filter (/= user) us) msgs

-- Send a message (only if user exists)
sendMessage :: ChatRoom -> User -> Message -> ChatRoom
sendMessage (ChatRoom us msgs) user (_, content)
  | user `elem` us = ChatRoom us (msgs ++ [(user, content)])
  | otherwise = ChatRoom us msgs

-- Fetch all messages (log preserved)
fetchMessages :: ChatRoom -> [Message]
fetchMessages (ChatRoom _ msgs) = msgs