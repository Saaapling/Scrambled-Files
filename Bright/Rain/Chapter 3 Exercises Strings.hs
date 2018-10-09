module Chapter3Excercises where

  given :: String
  given = "Curry is awesome"

  standard :: String
  standard = given ++ "!"

  fourthLetter = standard !! 4
  dropNine = drop 9 standard

  thirdLetter :: String -> Char
  thirdLetter x = x !! 2

  letterIndex :: String -> Int -> Char
  letterIndex string index = string !! (index-1)

  --Exercises 5 and 6 are done in Reverse.hs
