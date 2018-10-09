module CustomFunctions where

  myAnd :: [Bool] -> Bool
  myAnd [] = True
  myAnd (x:xs) = if x
    then myAnd xs
    else x

  myOr :: [Bool] -> Bool
  myOr [] = False
  myOr (x:xs) = if x
    then x
    else myOr xs

  myAny :: (a -> Bool) -> [a] -> Bool
  myAny _ [] = False
  myAny f (x:xs) = if (f x)
    then True
    else myAny f xs

  myElem :: Eq a => a -> [a] -> Bool
  myElem _ [] = False
  --myElem x (y:xs) = if (x==y)
  --  then True
  --  else myElem x xs
  myElem x y = myAny ((==) x) y

  myReverse :: [a] -> [a]
  myReverse [] = []
  myReverse (x:xs) = (myReverse xs) ++ (x : [])

  --Isn't this formatting really questionable??
  squish :: [[a]] -> [a]
  squish [] = []
  squish (x:xs) = x ++ squish xs

  squishMap :: (a -> [b]) -> [a] -> [b]
  squishMap _ [] = []
  squishMap f (x:xs) = f x ++ squishMap f xs

  --The function that creates lists has slipped my mind
  squishAgain :: Num a => [[a]] -> [a]
  squishAgain [] = []
  squishAgain (y:xs) = squishMap temporary y ++ squishAgain xs where
    temporary obj = [obj]

  --Better way of doing the next two? (Eg. using (x:xs))
  myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
  myMaximumBy function values = customCompare function (head values) (tail values) where
    customCompare _ x [] = x
    customCompare f x list = if (f x (head list)==GT)
      then customCompare f x (tail list)
      else customCompare f (head list) (tail list)

  myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
  myMinimumBy function values = customCompare function (head values) (tail values) where
    customCompare _ x [] = x
    customCompare f x list = if (f x (head list)==LT)
      then customCompare f x (tail list)
      else customCompare f (head list) (tail list)

  myMaximum :: (Ord a) => [a] -> a
  myMaximum x = myMaximumBy compare x

  myMinimum :: (Ord a) => [a] -> a
  myMinimum x = myMinimumBy compare x
