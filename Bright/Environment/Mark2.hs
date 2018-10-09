module CustomFunctionsMk2 where

  --point free template:
    --myFunc = foldr f z

  myAnd :: [Bool] -> Bool
  myAnd = foldr (\a b -> if (a==False) then False else b) True

  myAnd' :: [Bool] -> Bool
  myAnd' = foldr intermediary True where
    intermediary a b = if a
      then if b
        then True
        else False
      else False

  myOr :: [Bool] -> Bool
  myOr = foldr (\a b -> if (a==True) then True else b) False

  myAny :: (a -> Bool) -> [a] -> Bool
  myAny f = foldr (\a b -> if (f a) then True else b) False

  myElem :: Eq a => a -> [a] -> Bool
  myElem item = foldr (\a b -> if (a==item) then True else b) False

  myReverse :: [a] -> [a]
  myReverse = foldr (\a b -> b ++ [a]) []

  myMap :: (a -> b) -> [a] -> [b]
  myMap f = foldr (\a b -> (f a) : b) []

  myFilter :: (a -> Bool) -> [a] -> [a]
  myFilter f = foldr (\a b -> if (f a) then (a:b) else b) []

  squish :: [[a]] -> [a]
  squish = foldr (\a b -> a ++ b) []

  squishMap :: (a -> [b]) -> [a] -> [b]
  squishMap f = foldr (\a b -> (f a) ++ b) []

  squishAgain :: [[a]] -> [a]
  squishAgain = squishMap hellaSketchy where
    hellaSketchy [] = []
    hellaSketchy (x:xs) = x : hellaSketchy xs

  myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
  myMaximumBy f x = foldr (\a b -> if (f a b == GT) then a else b) (head x) x

  myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
  myMinimumBy f x = foldr (\a b -> if ((f a b) == LT) then a else b) (head x) x
