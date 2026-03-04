import MatrixADT

main :: IO ()
main = do
  let m = createMatrix 2 2 [[1, 2], [3, 4]]

  print (getElement m 0 1) -- Just 2
  print (getElement m 3 0) -- Nothing
  let m2 = setElement m 0 1 99
  print (getElement m2 0 1) -- Just 99