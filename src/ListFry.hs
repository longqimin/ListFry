module ListFry (listFry) where

import System.Random (randomRIO)
import Control.Monad (liftM)

listFry :: [a] -> IO [a]
listFry [] = return []
listFry xs = do
	r <- randomRIO (0, length xs - 1)
	let x = xs !! r
	let (left, right) = splitAt (r+1) xs
 	liftM (x:) $ listFry (init left ++ right)
