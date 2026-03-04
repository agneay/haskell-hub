-- CustomZipList.hs

-- Define ZipList
newtype ZipList a = ZipList {getZipList :: [a]}
  deriving (Show)

-- Functor instance
instance Functor ZipList where
  fmap f (ZipList xs) =
    ZipList (map f xs)

-- Applicative instance (pairwise application)
instance Applicative ZipList where
  pure x = ZipList (repeat x)

  ZipList fs <*> ZipList xs =
    ZipList (zipWith ($) fs xs)

-- Helper to take finite results (since pure is infinite)
takeZip :: Int -> ZipList a -> ZipList a
takeZip n (ZipList xs) =
  ZipList (take n xs)

-- Test cases
main :: IO ()
main = do
  let f = ZipList [(+ 1), (* 2)]
  let x = ZipList [1, 2]

  putStrLn "Pairwise application:"
  print (f <*> x) -- Expected: ZipList [2,4]
  putStrLn "\nTesting pure (first 5 values):"
  print (takeZip 5 (pure 10 :: ZipList Int))