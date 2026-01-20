{-
    Create a Closure to Track State 
Write a closure function counter that returns a function. 
Each time the returned function is called, it increments and returns an internal counter. 
-- Example Usage: 

-- c <- counter 

-- c >>= print -- Output: 1 

-- c >>= print -- Output: 2 
-}
import Data.IORef

-- Create a closure that tracks state
counter :: IO (IO Int)
counter = do
  ref <- newIORef 0
  return $ do
    modifyIORef ref (+1)
    readIORef ref