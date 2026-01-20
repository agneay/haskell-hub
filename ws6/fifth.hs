{-
Compose Functions Using Closures 
Write two functions: increment and square. 
Then use closures to create a new function incrementAndSquare that applies both functions in sequence. 
-- Example Usage: 

-- incrementAndSquare 3 => (3+1)^2 = 16 

-- incrementAndSquare (-1) => ((-1)+1)^2 = 0 
-}

increment :: Int -> Int
increment x = x + 1

square :: Int -> Int
square x = x^2

incrementAndSquare :: Int -> Int
incrementAndSquare = square.increment 