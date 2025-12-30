{-
Create Your Own for Loop.
Write a higher-order function forLoop that mimics the behavior of an imperative for loop.
 forLoop :: Int -> Int -> (Int -> IO ()) -> IO ()
-}

forLoop :: Int -> Int -> (Int -> IO ()) -> IO ()
forLoop start end body
  | start > end = return ()
  | otherwise = do
      body start
      forLoop (start + 1) end body
