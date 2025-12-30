data Person = Person
  { name :: String,
    age :: Int
  }

checkAge :: Person -> Bool
checkAge p = (age p) >= 18
