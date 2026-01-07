import Control.Monad.Reader

data Config = Config
  { appName :: String,
    maxRetries :: Int
  }

getAppTitle :: Reader Config String
getAppTitle = do
  cfg <- ask
  return ("Application: " ++ appName cfg)

getRetryMessage :: Reader Config String
getRetryMessage = do
  retries <- asks maxRetries
  return ("Max retries allowed: " ++ show retries)

program :: Reader Config String
program = do
  title <- getAppTitle
  retryInfo <- getRetryMessage
  return (title ++ "\n" ++ retryInfo)

main :: IO ()
main = do
  let config =
        Config
          { appName = "DemoApp",
            maxRetries = 3
          }

  putStrLn $ runReader program config
