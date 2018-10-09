module Chapter4Exercises where

  isPalindrome :: (Eq a) => [a] -> Bool
  isPalindrome x = (x==reverse x)

  myAbs :: Integer -> Integer
  myAbs x = if x>0
    then x
    else -x

  f :: (a, b) -> (c, d) -> ((b, d), (a, c))
  f x y = ((snd x, snd y), (fst x, fst y))

  x = (+)
  plusOne xs = x w 1
       where w = length xs

  identity x = x

  firstTerm :: [a] -> a
  firstTerm x = x !! 0

  firstTermTuple :: (a, b) -> a
  firstTermTuple x = fst x
