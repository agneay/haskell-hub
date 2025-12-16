data Shape = Circle Float | Rectangle Float Float

calculateArea :: Shape -> Float
calculateArea (Circle r) = 3.14 * r * r
calculateArea (Rectangle l b) = l * b
