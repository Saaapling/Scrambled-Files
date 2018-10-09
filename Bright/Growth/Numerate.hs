module CustomLists where

  eftOrd :: (Enum a, Ord a) => a -> a -> [a]
  eftOrd start end = listTime start end [] where
    listTime x y list
      |x<y = listTime (succ x) y (x:list)
      |otherwise = reverse (x:list)
