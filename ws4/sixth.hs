-- Use the Writer monad to keep a log of function steps.

import Control.Monad.Writer

processNumber :: Int -> Writer [String] Int
processNumber x = do
  tell ["Starting with " ++ show x]
  let y = x * 2
  tell ["After doubling: " ++ show y]
  let z = y + 10
  tell ["After adding 10: " ++ show z]
  return z

runProcess :: Writer [String] Int
runProcess = do
  a <- processNumber 5
  tell ["Final result Computed"]
  return a

main :: IO ()
main = do
  let (result, logMessage) = runWriter runProcess
  putStrLn $ "Result: " ++ show result
  putStrLn "Log:"
  mapM_ putStrLn logMessage