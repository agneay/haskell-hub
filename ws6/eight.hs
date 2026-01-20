{-
Implement Function Composition with Lambdas 
Write a custom composition operator composeLambda using lambdas. 
-- Example Usage: 
-- let addOne = (+1) 
-- let double = (*2) 
-- let composedFunc = composeLambda double addOne -- equivalent to double . addOne 
-- ComposedFunc 3 => double (addOne 3) => (3+1)*2 = 8 
-}

composeLambda :: (b -> c) -> (a -> b) -> (a -> c)
composeLambda f g = \x -> f (g x)