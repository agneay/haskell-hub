import StackADT

main :: IO ()
main = do
  let s0 = empty
  let s1 = push 10 s0
  let s2 = push 20 s1
  print (top s2)
  let (x, s3) = pop s2
  print x
  print (isEmpty s3)