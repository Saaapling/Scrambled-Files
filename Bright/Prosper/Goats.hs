{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
module Goats where

  newtype Goats = Goats Int deriving (Eq, Show, TooMany)
  --instance TooMany Goats where
    --tooMany (Goats n) = tooMany n
  newtype Cows = Cows Int deriving (Eq, Show)

  tooManyGoats :: Goats -> Bool
  tooManyGoats (Goats n) = n > 42

  tooManyCows :: Cows -> Bool
  tooManyCows (Cows n) = n>1000000000000

  class TooMany a where
    tooMany :: a -> Bool

  instance TooMany Int where
    tooMany n = n > 42

  instance TooMany (Int, String) where
    tooMany n = if (snd n == "Goats")
      then tooMany (fst n)
      else True

  instance TooMany (Int, Int) where
    tooMany x = tooMany (fst x + snd x)

  instance (Num a, TooMany a) => TooMany (a, a) where
    tooMany x = tooMany (fst x - snd x)
