-- ComposeApplicative.hs

import Control.Applicative (liftA2)

-- Define Compose type
newtype Compose f g a = Compose {getCompose :: f (g a)}
  deriving (Show)

-- Functor instance
instance (Functor f, Functor g) => Functor (Compose f g) where
  fmap h (Compose fga) =
    Compose (fmap (fmap h) fga)

-- Applicative instance
instance
  (Applicative f, Applicative g) =>
  Applicative (Compose f g)
  where
  pure x = Compose (pure (pure x))

  Compose fgf <*> Compose fgx =
    Compose (liftA2 (<*>) fgf fgx)

-- -------------------------
-- Test cases
-- -------------------------

main :: IO ()
main = do
  -- Example 1
  let f = Compose [Just (+ 1)]
  let x = Compose [Just 2]

  putStrLn "Example 1:"
  print (f <*> x)
  -- Expected: Compose [Just 3]

  -- Example 2 (multiple effects)
  let f2 = Compose [Just (* 2), Nothing]
  let x2 = Compose [Just 3, Just 4]

  putStrLn "\nExample 2:"
  print (f2 <*> x2)

-- Expected:
-- Compose [Just 6, Just 8, Nothing, Nothing]