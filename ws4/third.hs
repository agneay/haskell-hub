import Data.Char (toUpper)

main :: IO()
main = do
    putStrLn "Enter Some Text"
    input <- getLine
    let processedText = map toUpper input
    putStrLn processedText