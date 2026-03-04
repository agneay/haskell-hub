-- NestedListFunctor.hs

-- Define the recursive data type
data NestedList a
  = Elem a
  | List [NestedList a]
  deriving (Show)

-- Implement Functor for NestedList
instance Functor NestedList where
  fmap f (Elem x) = Elem (f x)
  fmap f (List xs) = List (map (fmap f) xs)

-- Test functions
increment :: Int -> Int
increment x = x + 1

double :: Int -> Int
double x = x * 2

-- Main function for testing
main :: IO ()
main = do
  let nested = List [Elem 1, List [Elem 2, Elem 3]]

  putStrLn "Original Nested List:"
  print nested

  putStrLn "\nAfter applying (+1):"
  print (fmap increment nested)

  putStrLn "\nAfter applying (*2):"
  print (fmap double nested)