-- TreeApplicative.hs

-- Define binary tree
data Tree a
  = Empty
  | Node a (Tree a) (Tree a)
  deriving (Show)

-- Functor instance
instance Functor Tree where
  fmap _ Empty = Empty
  fmap f (Node x l r) =
    Node (f x) (fmap f l) (fmap f r)

-- Applicative instance
instance Applicative Tree where
  -- pure creates an infinite tree
  pure x = let t = Node x t t in t

  -- Apply functions stored in one tree to values in another
  Empty <*> _ = Empty
  _ <*> Empty = Empty
  Node f lf rf <*> Node x lx rx =
    Node (f x) (lf <*> lx) (rf <*> rx)

-- Helper function to take finite depth (since pure is infinite)
takeDepth :: Int -> Tree a -> Tree a
takeDepth _ Empty = Empty
takeDepth 0 _ = Empty
takeDepth n (Node x l r) =
  Node x (takeDepth (n - 1) l) (takeDepth (n - 1) r)

-- Main tests
main :: IO ()
main = do
  -- Finite function tree
  let funcTree =
        Node
          (+ 1)
          (Node (* 2) Empty Empty)
          (Node (\x -> x - 1) Empty Empty)

  -- Finite value tree
  let valueTree =
        Node
          2
          (Node 3 Empty Empty)
          (Node 4 Empty Empty)

  putStrLn "Applying function tree to value tree:"
  print (funcTree <*> valueTree)

  -- Test pure
  putStrLn "\nTesting pure 5 (depth 3 only):"
  print (takeDepth 3 (pure 5 :: Tree Int))