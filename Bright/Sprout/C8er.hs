module Chapter8Exercises where

  cattyConny :: String -> String -> String
  cattyConny x y = x ++ " mrow " ++ y

  flippy = flip cattyConny
  appedCatty = cattyConny "woops"
  frappe = flippy "haha"

  main :: IO()
  main = do
    print (appedCatty "woohoo!")              -- "woops mrow woohoo!"
    print (frappe "1")                        -- "1 mrow haha"
    print (frappe (appedCatty "2"))           -- "woops mrow 2 mrow haha"
    print (appedCatty (frappe "blue"))        -- "woops mrow blue mrow haha"
    print (cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue")))
      -- cattyConny "pink mrow haha" (cattyConny "green" "woops mrow blue")
      -- cattyConny "pink mrow haha" "green mrow woops mrow blue"
      -- "pink mrow haha mrow green mrow woops mrow blue"
    print (cattyConny (flippy "Pugs" "are") "awesome")
      -- cattyConny "are mrow Pugs" "awesome"
      -- "are mrow Pugs mrow awesome"

  --dividedBy Function (divMod) (Indentation Error??)
    --Fixed, the example was incorrect = Cancer Incarnate
  dividedBy :: Integral a => a -> a -> (a, a)
  dividedBy numerator denominator = go numerator denominator 0 where
    go x y count
      |x<y = (count, x)
      |otherwise = go (x-y) y (count+1)
  --dividedBy 15 2
    -- go 15 2 0
      --15>2 -> go 13 2 1
      --13>2 -> go 11 2 2
      --11>2 -> go 9 2 3
      --9>2  -> go 7 2 4
      --7>2  -> go 5 2 5
      --5>2  -> go 3 2 6
      --3>2  -> go 1 2 7
      --1<2  -> (7, 1)

  --Sums numbers from 1 to n, where n is the argument passed
  factorialSum :: (Eq a, Num a) => a -> a
  factorialSum 1 = 1
  factorialSum x = x + factorialSum (x-1)

  --multipliedBy Function
  multipliedBy :: Integral a => a -> a -> a
  multipliedBy x y = go x y 0 where
    go num count total
      |count == 0 = total
      |otherwise = go num (count-1) (total + num)
