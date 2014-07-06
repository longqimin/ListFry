module Main where

import Test.Tasty
import qualified Test.Tasty.HUnit as HU
import ListFry

test1 = HU.testCase "" (1 HU.@=? 1)


allTests :: TestTree
allTests = testGroup "Tasty tests" [
	testGroup "HUnit test" [test1]
	]

main :: IO ()
main = defaultMain allTests