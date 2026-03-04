import SetADT

main :: IO ()
main = do
  let s0 = empty
  let s1 = addElement s0 10
  let s2 = addElement s1 5
  let s3 = addElement s2 10 -- duplicate ignored
  print (containsElement s3 5) -- True
  print (containsElement s3 7) -- False
  let s4 = removeElement s3 5
  print (containsElement s4 5) -- False