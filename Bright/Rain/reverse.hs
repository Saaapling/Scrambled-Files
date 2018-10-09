module Reverse where

  pfac n
    | n <= 1    = []
    | otherwise = rec n 2
    where rec n try
            | try > n         = []
            | mod n try == 0  = try : rec (div n try) try
            | otherwise       = rec n (try + 1)

  rvrs :: String -> String
--reverse method
  rvrs target = swap target
  swap initial
            |length initial>0      = initial !! (length initial - 1) : swap (take (length initial - 1) initial)
            |otherwise             = ""

--Much more concise
  crvrs initial
            |length initial>0      = initial !! (length initial - 1) : crvrs (take (length initial - 1) initial)
            |otherwise             = ""

  main :: IO()
  main = print (rvrs("Curry is awesome!"))
