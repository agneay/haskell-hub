-- CustomOperator.hs

-- Define our own operator (alias for fmap)
(<$$>) :: (Functor f) => (a -> b) -> f a -> f b
(<$$>) = fmap

infixl 4 <$$> -- Same precedence as <$>

-- Custom recursive type
data NestedList a
  = Elem a
  | List [NestedList a]
  deriving (Show)

-- Functor instance for NestedList
instance Functor NestedList where
  fmap f (Elem x) = Elem (f x)
  fmap f (List xs) = List (map (fmap f) xs)

-- Test functions
increment :: Int -> Int
increment x = x + 1

double :: Int -> Int
double x = x * 2

main :: IO ()
main = do
  -- Maybe examples
  putStrLn "Maybe Examples:"
  print $ increment <$$> Just 5 -- Just 6
  print $ increment <$$> Nothing -- Nothing

  -- List examples
  putStrLn "\nList Examples:"
  print $ double <$$> [1, 2, 3] -- [2,4,6]

  -- Custom NestedList example
  putStrLn "\nNestedList Example:"
  let nested = List [Elem 1, List [Elem 2, Elem 3]]
  print $ increment <$$> nested