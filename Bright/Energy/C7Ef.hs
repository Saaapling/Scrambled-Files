module Chapter7Exercises where

--7.4 Intermission
  k (x, y) = x
  k1 = k ((4-1), 10)
  k2 = k ("three", (1+2))
  k3 = k (3, True)
  --1. What is the type of k?
    -- k :: (a, b) -> a
  --2. What is type of k2? Is it the same type as k1 or k3
    -- k2 :: [Char]
    -- k1 :: Num a => a // Integer?
    -- k3 :: Num a => a // Integer?
  --3. Of k1, k2, k3, which will return the number 3 as the result?
    -- Why both k1 and k3 of course
  f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
  f (a, b, c) (d, e, f) = ((a, d), (c, f))

--7.5 Intermission
  --functionC x y = if (x>y) then x else y
  functionC x y =
    case x>y of
      True  -> x
      False -> y
  --ifEvenAdd2 n = if (even n) then (n+2) else n
  ifEvenAdd2 n =
    case redundant of
      True  -> n+2
      False -> n
    where redundant = even n
  --Fix the incomplete case
  nums x =
    case compare x 0 of
      LT -> -1
      GT -> 1
      EQ -> 0

  --7.6 Intermission
  dodgy x y = x + y * 10
  oneIsOne = dodgy 1
  oneIsTwo = flip dodgy 2
    --dodgy 1 0 = 1
    --dodgy 1 1 = 11
    --dodgy 2 2 = 22
    --dodgy 1 2 = 21
    --dodgy 2 1 = 12
    --oneIsOne 1 = 11
    --oneIsOne 2 = 21
    --oneIsTwo 1 = 21
    --oneIsTwo 2 = 22
    --oneIsOne 3 = 31
    --oneIsTwo 3 = 23

  --7.7 Intermission
  pal xs
      | xs == reverse xs = True
      | otherwise        = False
  numbers x
      | x < 0    = -1
      | x == 0   = 0
      | x > 0    = 1

  --Chapter 7 Exercises
  tensDigit :: Integral a => a -> a
  tensDigit x = d where
    xLast = x `div` 10
    d = xLast `mod` 10
  tensDigit' :: Integral a => a -> a  --How do I compose this function???
  tensDigit' x = d where              --Without using parenthesis that is
    step1 = fst (divMod x 10)
    d = snd (divMod step1 10)
    --d = snd (divMod (fst (divMod x 10)) 10)
  hunsDigit :: Integral a => a -> a
  hunsDigit x = d where
    step1 = fst (divMod x 100)
    d = snd (divMod step1 10)

  foldBool :: a -> a -> Bool -> a
  foldBool x y z =
    case z of
      True -> x
      False -> y
  foldBool' :: a -> a -> Bool -> a
  foldBool' x y z
    | z         = x
    | otherwise = y

  --Takes a function and a tuple, changing the first item in the tuple,
  --Sample: g toInteger (3, "Adf")
  g :: (a -> b) -> (a, c) -> (b, c)
  g x y = (x (fst y), snd y)

 roundTrip :: (Show a, Read a) => a -> a
 roundTrip a = read (show a)
 --roundTrip = (read . show)
 main' = do
   print (roundTrip 4)
   print (id 4)
