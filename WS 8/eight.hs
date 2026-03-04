data Tree a = Node a (Tree a) (Tree a)

leaf :: Tree a
leaf = Node undefined leaf leaf

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibTreeFrom :: Integer -> Tree Integer
fibTreeFrom 0 = Node 0 leaf leaf
fibTreeFrom 1 = Node 1 leaf leaf
fibTreeFrom n =
  Node
    (fib n)
    (fibTreeFrom (n - 1))
    (fibTreeFrom (n - 2))

fibTree :: Tree Integer
fibTree = fibTreeFrom 5

takeLevels :: Int -> Tree a -> Tree a
takeLevels 0 (Node v _ _) = Node v leaf leaf
takeLevels n (Node v l r) =
  Node
    v
    (takeLevels (n - 1) l)
    (takeLevels (n - 1) r)

printTree :: (Show a) => Int -> Tree a -> IO ()
printTree depth tree = printHelper "" True depth tree
  where
    printHelper _ _ 0 _ = return ()
    printHelper prefix isLeft d (Node v l r) = do
      putStrLn (prefix ++ (if isLeft then "├── " else "└── ") ++ show v)
      let newPrefix = prefix ++ (if isLeft then "│   " else "    ")
      printHelper newPrefix True (d - 1) l
      printHelper newPrefix False (d - 1) r

main :: IO ()
main = do
  putStrLn "Lazy Fibonacci Tree (first 3 levels):"
  printTree 3 fibTree