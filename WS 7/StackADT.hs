-- Stack ADT
module StackADT
  ( Stack,
    empty,
    isEmpty,
    push,
    pop,
    top,
  )
where

import System.Win32 (COORD (xPos))

newtype Stack a = Stack [a]

empty :: Stack a
empty = Stack []

isEmpty :: Stack a -> Bool
isEmpty (Stack xs) = null xs

push :: a -> Stack a -> Stack a
push x (Stack xs) = Stack (x : xs)

pop :: Stack a -> (a, Stack a)
pop (Stack []) = error "Sack underflow: Cannot pop from empty stack"
pop (Stack (x : xs)) = (x, Stack xs)

top :: Stack a -> a
top (Stack []) = error "Stack is empty: No top element"
top (Stack (x : _)) = x