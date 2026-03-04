module SetADT
  ( Set,
    empty,
    addElement,
    removeElement,
    containsElement,
  )
where

-- Internal representation (hidden)
newtype Set a = Set [a]

-- Create empty set
empty :: Set a
empty = Set []

-- Add element (maintain sorted order, no duplicates)
addElement :: (Ord a) => Set a -> a -> Set a
addElement (Set xs) x =
  Set (insertSorted x xs)

-- Remove element
removeElement :: (Ord a) => Set a -> a -> Set a
removeElement (Set xs) x =
  Set (removeSorted x xs)

-- Check membership
containsElement :: (Ord a) => Set a -> a -> Bool
containsElement (Set xs) x =
  elemSorted x xs

-- Helper: insert while keeping sorted + unique
insertSorted :: (Ord a) => a -> [a] -> [a]
insertSorted x [] = [x]
insertSorted x (y : ys)
  | x < y = x : y : ys
  | x == y = y : ys
  | otherwise = y : insertSorted x ys

-- Helper: remove from sorted list
removeSorted :: (Ord a) => a -> [a] -> [a]
removeSorted _ [] = []
removeSorted x (y : ys)
  | x < y = y : ys
  | x == y = ys
  | otherwise = y : removeSorted x ys

-- Helper: efficient membership for sorted list
elemSorted :: (Ord a) => a -> [a] -> Bool
elemSorted _ [] = False
elemSorted x (y : ys)
  | x < y = False
  | x == y = True
  | otherwise = elemSorted x ys