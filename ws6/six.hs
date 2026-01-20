applyNTimes :: Int -> (a -> a) -> a -> a
applyNTimes n f x = foldl (\acc _ -> f acc) x [1..n]