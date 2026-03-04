module MatrixADT
  ( Matrix,
    createMatrix,
    getElement,
    setElement,
  )
where

-- Internal representation (hidden)
data Matrix a = Matrix Int Int [[a]]

-- Create a matrix with rows, cols, and data
createMatrix :: Int -> Int -> [[a]] -> Matrix a
createMatrix r c values
  | length values /= r = error "Row count mismatch"
  | any (\row -> length row /= c) values = error "Column count mismatch"
  | otherwise = Matrix r c values

-- Get element (0-based indexing)
getElement :: Matrix a -> Int -> Int -> Maybe a
getElement (Matrix r c values) i j
  | i < 0 || i >= r = Nothing
  | j < 0 || j >= c = Nothing
  | otherwise =
      Just ((values !! i) !! j)

-- Set element (0-based indexing)
setElement :: Matrix a -> Int -> Int -> a -> Matrix a
setElement (Matrix r c values) i j newVal
  | i < 0 || i >= r = error "Row index out of bounds"
  | j < 0 || j >= c = error "Column index out of bounds"
  | otherwise =
      Matrix r c (updateRow values i j newVal)

-- Helper to update specific element
updateRow :: [[a]] -> Int -> Int -> a -> [[a]]
updateRow rows i j newVal =
  take i rows
    ++ [updateCol (rows !! i) j newVal]
    ++ drop (i + 1) rows

updateCol :: [a] -> Int -> a -> [a]
updateCol row j newVal =
  take j row
    ++ [newVal]
    ++ drop (j + 1) row