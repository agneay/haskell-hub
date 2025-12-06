{-
    Define a function fizzBuzz that takes an Int and returns: 

 

    "Fizz" if it's divisible by 3 

    "Buzz" if it's divisible by 5 

    "FizzBuzz" if it's divisible by both 3 and 5 

    The number itself as a string otherwise 
-}

fizzBuzz :: Int -> String
fizzBuzz x
  | (x `mod` 15 == 0) = "FizzBuzz"
  | (x `mod` 3 == 0) = "Fizz"
  | (x `mod` 5 == 0) = "Buzz"
  | otherwise = show x
