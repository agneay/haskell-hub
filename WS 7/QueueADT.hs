module QueueADT
  ( Queue,
    empty,
    enqueue,
    dequeue,
    isEmpty,
  )
where

newtype Queue a = Queue ([a], [a])

empty :: Queue a
empty = Queue ([], [])

isEmpty :: Queue a -> Bool
isEmpty (Queue (front, rear)) = null front && null rear

enqueue :: a -> Queue a -> Queue a
enqueue x (Queue (front, rear)) = Queue (front, x : rear)

dequeue :: Queue a -> (a, Queue a)
dequeue (Queue ([], [])) = error "Queue underflow : Cannot dequeue from empty queue"
dequeue (Queue ([], rear)) = dequeue (Queue (reverse rear, []))
dequeue (Queue (x : xs, rear)) = (x, Queue (xs, rear))