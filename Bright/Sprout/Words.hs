module WordNumber where

  import Data.List (intersperse)

  --Bad Efficiency, better way to do this?
  digitToWord :: Int -> String
  digitToWord n
    |n==1 = "one-"
    |n==2 = "two-"
    |n==3 = "three-"
    |n==4 = "four-"
    |n==5 = "five-"
    |n==6 = "six-"
    |n==7 = "seven-"
    |n==8 = "eight-"
    |n==9 = "nine-"
    |otherwise = "zero-"

  digits :: Int -> [Int]
  digits n = allah n [] where
    allah number digits
      |number>0 = allah (fst (divMod number 10)) ((:[])(snd (divMod number 10)) ++ digits)
      |otherwise = digits

  --Is this the appropriate way to split a function in (multiple) lines
  wordNumber :: Int -> String
  wordNumber n = take (length intermediary - 1) intermediary where
    intermediary = concat (map digitToWord (digits n))

  test = (:[]) 123456
