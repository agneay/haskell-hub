import BSTADT

main :: IO ()
main = do
  let t0 = empty
  let t1 = insert 50 t0
  let t2 = insert 30 t1
  let t3 = insert 70 t2
  let t4 = insert 20 t3
  let t5 = insert 40 t4

  print (search 30 t5) -- True
  print (search 100 t5) -- False
  let t6 = delete 30 t5
  print (search 30 t6) -- False