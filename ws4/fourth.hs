-- Use the State monad to count how many times a function is called.

import Control.Monad.State

type CounterState = State Int

incrementCounter :: CounterState String
incrementCounter = do
  count <- get
  put (count + 1)
  return "Action Performed"

program :: CounterState String
program = do
  incrementCounter
  incrementCounter
  incrementCounter
  return "Done"

main :: IO ()
main = do
  let (result, finalCount) = runState program 0
  putStrLn $ "Result: " ++ result
  putStrLn $ "Final Count:" ++ show finalCount