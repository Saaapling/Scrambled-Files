module McCarthy91 where

  --This seems like the most useless function??
  mc91 :: (Num a, Ord a) => a -> a
  mc91 x
    |x>100 = x - 10
    |otherwise = (mc91 . mc91) (x + 11)
