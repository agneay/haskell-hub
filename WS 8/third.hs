-- FileSearch.hs

import System.Directory
import System.FilePath
import Control.Monad
import Data.Char (toLower)
import System.Environment (getArgs)

-- Convert string to lowercase
toLowerStr :: String -> String
toLowerStr = map toLower

-- Recursively collect all .txt files
getTxtFiles :: FilePath -> IO [FilePath]
getTxtFiles dir = do
    contents <- listDirectory dir
    paths <- forM contents $ \name -> do
        let fullPath = dir </> name
        isDir <- doesDirectoryExist fullPath
        if isDir
            then getTxtFiles fullPath
            else return [fullPath | takeExtension fullPath == ".txt"]
    return (concat paths)

-- Search for pattern in a single file
searchInFile :: String -> FilePath -> IO ()
searchInFile pattern file = do
    content <- readFile file
    let ls = zip [1..] (lines content)
    let lowerPattern = toLowerStr pattern
    forM_ ls $ \(lineNum, lineText) ->
        when (lowerPattern `isIn` toLowerStr lineText) $
            putStrLn (file ++ " (Line " ++ show lineNum ++ "): " ++ lineText)

-- Helper for substring check
isIn :: String -> String -> Bool
isIn pat str = any (pat `prefixOf`) (tails str)

-- Check prefix
prefixOf :: String -> String -> Bool
prefixOf [] _ = True
prefixOf _ [] = False
prefixOf (x:xs) (y:ys) = x == y && prefixOf xs ys

-- Generate all suffixes
tails :: [a] -> [[a]]
tails [] = [[]]
tails xs@(_:ys) = xs : tails ys

-- Main
main :: IO ()
main = do
    args <- getArgs
    case args of
        [directory, pattern] -> do
            files <- getTxtFiles directory
            forM_ files (searchInFile pattern)
        _ -> putStrLn "Usage: runhaskell FileSearch.hs <directory> <pattern>"