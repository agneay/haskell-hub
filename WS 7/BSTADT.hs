module BSTADT
  ( BST,
    empty,
    insert,
    delete,
    search,
  )
where

-- Internal structure (NOT exported)
data BST a
  = Empty
  | Node a (BST a) (BST a)

-- Create an empty tree
empty :: BST a
empty = Empty

-- Insert into BST
insert :: (Ord a) => a -> BST a -> BST a
insert x Empty = Node x Empty Empty
insert x (Node val left right)
  | x < val = Node val (insert x left) right
  | x > val = Node val left (insert x right)
  | otherwise = Node val left right -- no duplicates

-- Search in BST
search :: (Ord a) => a -> BST a -> Bool
search _ Empty = False
search x (Node val left right)
  | x < val = search x left
  | x > val = search x right
  | otherwise = True

-- Delete from BST
delete :: (Ord a) => a -> BST a -> BST a
delete _ Empty = Empty
delete x (Node val left right)
  | x < val = Node val (delete x left) right
  | x > val = Node val left (delete x right)
  | otherwise = deleteNode (Node val left right)

-- Helper for deletion cases
deleteNode :: (Ord a) => BST a -> BST a
deleteNode (Node _ Empty right) = right
deleteNode (Node _ left Empty) = left
deleteNode (Node _ left right) =
  let minVal = findMin right
   in Node minVal left (delete minVal right)

-- Find minimum element (leftmost)
findMin :: BST a -> a
findMin (Node val Empty _) = val
findMin (Node _ left _) = findMin left
findMin Empty = error "Tree is empty"