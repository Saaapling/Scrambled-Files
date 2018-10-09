module Chapter5Excercises where

  funcIgnoreArgs :: a -> a -> a -> String
  funcIgnoreArgs x y z = "This will NEVER change"

  diffFunc :: a -> b -> c -> String
  diffFunc x y z = "And this is only slightly different"

  functionH (x:_) = x

  --functionC :: (Ord a) => a -> a -> Bool
  functionC x y = if (x>y) then True else False

  --functionS :: (a, b) -> a
  functionS (x, y) = y

  fstString :: [Char] -> [Char]
  fstString x = x ++ " in the rain"
  sndString :: [Char] -> [Char]
  sndString x = x ++ " over the rainbow"
  sing = if (x < y) then fstString x else sndString y
    where x = "Singin"
          y = "Somewhere"

  main :: IO ()
  main = do
    print (1 + 2)
    putStrLn "10"
    print (negate (-1))
    print ((+) 0 blah) where
      blah = negate 1

--Example Problem
  data Woot
  data Blah
  f :: Woot -> Blah
  f = undefined
  g (b, w) = (b, f w)
--g :: (Blah, Woot) -> (Blah, Blah)

--Question 1
  f' :: Int -> String
  f' = undefined
  g'::String -> Char
  g' = undefined
  h' :: Int -> Char
  h' x = (g' (f' x))
--h' :: Int -> Char

--Question 2
  data A
  data B
  data C
  q :: A -> B
  q = undefined
  w :: B -> C
  w = undefined
  e x = w (q x)
--e :: A -> C

--Question 3
  data X
  data Y
  data Z
  xz :: X -> Z
  xz = undefined
  yz :: Y -> Z
  yz = undefined
  xform (a, b) = (xz a, yz b)
--xform :: (X, Y) -> (Z, Z)

--Question 4
--munge :: (x -> y) -> (y -> (w, z)) -> x -> w
--Is this actually: x ->
