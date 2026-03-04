import PriorityQueueADT

main :: IO ()
main = do
  let pq0 = empty
  let pq1 = insertWithPriority 3 "Task A" pq0
  let pq2 = insertWithPriority 1 "Task B" pq1
  let pq3 = insertWithPriority 2 "Task C" pq2

  let (x1, pq4) = extractMin pq3
  putStrLn $ "Extracted: " ++ x1

  let (x2, pq5) = extractMin pq4
  putStrLn $ "Extracted: " ++ x2

  print (isEmpty pq5)