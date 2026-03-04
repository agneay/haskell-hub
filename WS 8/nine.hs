-- Infinite list of partial sums approximating Pi
piApproximation :: [Double]
piApproximation =
  scanl1 (+) leibnizTerms

-- Infinite Leibniz series terms
leibnizTerms :: [Double]
leibnizTerms =
  [ 4 * ((-1) ** fromIntegral n) / fromIntegral (2*n + 1)
  | n <- [0..]
  ]

main :: IO ()
main = do
  print $ take 10 piApproximation