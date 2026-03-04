module PriorityQueueADT
  ( PriorityQueue,
    empty,
    insertWithPriority,
    extractMin,
    isEmpty,
  )
where

-- Internal representation (hidden)
newtype PriorityQueue p a = PQ [(p, a)]

-- Create empty priority queue
empty :: PriorityQueue p a
empty = PQ []

-- Check if empty
isEmpty :: PriorityQueue p a -> Bool
isEmpty (PQ xs) = null xs

-- Insert while maintaining sorted order (ascending priority)
insertWithPriority :: (Ord p) => p -> a -> PriorityQueue p a -> PriorityQueue p a
insertWithPriority p x (PQ xs) =
  PQ (insertSorted (p, x) xs)

-- Helper to insert in sorted position
insertSorted :: (Ord p) => (p, a) -> [(p, a)] -> [(p, a)]
insertSorted item [] = [item]
insertSorted item@(p, _) (y@(p2, _) : ys)
  | p <= p2 = item : y : ys
  | otherwise = y : insertSorted item ys

-- Extract element with minimum priority
extractMin :: (Ord p) => PriorityQueue p a -> (a, PriorityQueue p a)
extractMin (PQ []) =
  error "PriorityQueue underflow: Cannot extract from empty queue"
extractMin (PQ ((_, x) : xs)) =
  (x, PQ xs)