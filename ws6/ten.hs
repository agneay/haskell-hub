{-
Create a Function Pipeline with Lambdas 
Write a pipeline function pipeline that chains multiple transformations on an input using lambdas. 
-- Example Usage: 
-- pipeline [(+1), (*2), (^2)] 3 => ((3+1)*2)^2 = 64 
-}

pipeline :: [a -> a] -> a -> a
pipeline fs x = foldl (\acc f -> f acc) x fs