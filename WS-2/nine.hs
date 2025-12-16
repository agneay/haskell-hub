countConsecutiveDuplicates :: (Eq a) => [a] -> [(a, Int)]
countConsecutiveDuplicates [] = []
countConsecutiveDuplicates (x : xs) =
  let (same, rest) = span (== x) xs
   in (x, 1 + length same) : countConsecutiveDuplicates rest
