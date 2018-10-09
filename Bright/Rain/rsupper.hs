module Reverse2 where

  pfac n
    | n <= 1    = []
    | otherwise = rec n 2
    where rec n try
            | try > n         = []
            | mod n try == 0  = try : rec (div n try) try
            | otherwise       = rec n (try + 1)

  rvrs word
    | length word>=1  = word !! (length word - 1) : rvrs (take (length word -1) word)
    | otherwise      = ""

  main :: IO ()
  main = print (rvrs ("Curry is awesome"))
