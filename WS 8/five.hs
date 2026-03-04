module Main where

primes :: [Integer]
primes = 2 : sieve [3, 5 ..] -- Skip even numbers immediately
  where
    sieve (p : xs) =
      p : sieve [x | x <- xs, x `mod` p /= 0]

main :: IO ()
main = do
  putStrLn "First 10 prime numbers:"
  print $ take 10 primes

  putStrLn "\nFirst 20 prime numbers:"
  print $ take 20 primes