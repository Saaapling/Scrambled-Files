module Division where

  --dividedBy Function (divMod)
    --Sketchy Version (How do I nest gaurd statements?)
  dividedBy :: Integral a => a -> a -> (a, a)
  dividedBy num denom
    |num>0 && denom>0 = pospos num denom 0
    |num>0 && denom<0 = posneg num denom 0
    |num<0 && denom>0 = negpos num denom 0
    |otherwise = negneg num denom 0

  pospos :: Integral a => a -> a -> a -> (a,a)
  pospos x y count
    |x<y = (count, x)
    |otherwise = pospos (x-y) y (count+1)

  posneg :: Integral a => a -> a -> a -> (a,a)
  posneg x y count
    |x<0 = (count, x)
    |otherwise = posneg (x+y) y (count-1)

  negpos :: Integral a => a -> a -> a -> (a,a)
  negpos x y count
    |x>0 = (count, x)
    |otherwise = negpos (x+y) y (count-1)

  negneg :: Integral a => a -> a -> a -> (a,a)
  negneg x y count
    |x>y = (count, x)
    |otherwise = negneg (x-y) y (count+1)
