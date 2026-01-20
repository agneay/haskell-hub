{-
    Create a Function with Partial Application 

Write a function multiply that takes two arguments, and then use partial application to create a new function double that doubles its input. 

-- Example Usage: 

-- double 5 => 10 

-- double 10 => 20 
-}
multiply :: Int -> Int -> Int
multiply x y = x * y

double :: Int -> Int
double = multiply 2