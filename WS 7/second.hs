import QueueADT

main :: IO ()
main = do
  let q0 = empty
  putStrLn $ "Is queue empty ?" ++ show (isEmpty q0)

  let q1 = enqueue 10 q0
  let q2 = enqueue 20 q1
  let q3 = enqueue 30 q2

  putStrLn $ "Is queue empty  after enqueues? " ++ show (isEmpty q3)

  let (x1, q4) = dequeue q3
  putStrLn $ "Dequeued: " ++ show x1

  let (x2, q5) = dequeue q4
  putStrLn $ "Dequeued: " ++ show x2

  let (x3, q6) = dequeue q5
  putStrLn $ "Dequeued: " ++ show x3

  putStrLn $ "Is queue empty at the end? " ++ show (isEmpty q6)