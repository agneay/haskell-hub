-- Use the Reader monad to get a configuration value.

cartesianProduct :: [a] -> [b] -> [(a, b)]
cartesianProduct xs ys = do
  x <- xs
  y <- ys
  return (x, y)

main :: IO ()
main = print $ cartesianProduct [1, 2, 3] ['a', 'b']