{-
Given a nested tuple ((a, b), c),
write a function flattenTuple that returns a three-element tuple (a, b, c).
-}

flattenTuple :: ((a, b), c) -> (a, b, c)
flattenTuple ((a, b), c) = (a, b, c)