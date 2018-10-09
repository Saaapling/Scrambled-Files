module Fibonacci where

  fibs = 1 : scanl (+) 1 fibs
    --1 : 1 : (1+1 : scanl (+) 2 fibs) fibs = [|1|, 1, tbd]
    --1 : 1 : 2 : (2+1 : scanl (+) 3 fibs) fibs = [1, |1|, 2, tbd]
    --1 : 1 : 2 : 3 : (3+2 : scanl (+) 5 fibs} fibs = [1, 1, |2|, 3, tbd]
    --1 : 1 : 2 : 3 : 5 : (5+3 : scanl (+) 8 fibs) fibs = [1, 1, 2, |3|, 5, tbd]
  fibsN x = fibs !! x
  fibs20 = take 20 fibs
  fibs100 = takeWhile (<100) fibs

  factorial = scanl (*) 1 [1..10]

  personalInterest :: Fractional a => [Integer] -> [a]
  personalInterest (x:xs) = if (length xs >1 )
    then (fromIntegral . head) xs / (fromIntegral x) : personalInterest xs
    else []
