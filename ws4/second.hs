-- Use the List monad to generate pairs (x, y) where x is from [1,2,3] and y is from [4,5]. 

generatePairsBind :: [(Int,Int)]
generatePairsBind = do
    x <- [1,2,3]
    y <- [4,5]
    return (x,y)