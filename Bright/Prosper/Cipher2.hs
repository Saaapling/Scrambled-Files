module Ciphers where

  import Data.Char

  vigenere :: String -> String -> String
  vigenere [] _ = []
  vigenere _ [] = []
  vigenere (x:code) (y:helper) = caeserCipher [x] "right" (ord (toLower y) - 97) ++ vigenere code helper

--Old Stuff below (reused)
  caeserCipher :: String -> String -> Int -> String
  caeserCipher "" _ _ = ""
  caeserCipher message direction amount = if (ignoreCaps direction "right")
    then if (isLetter (head message))
      then shiftChar (head message) amount : caeserCipher (tail message) direction amount
      else head message : caeserCipher (tail message) direction amount
    else if (isLetter (head message))
      then shiftChar (head message) (-amount) : caeserCipher (tail message) direction amount
      else head message : caeserCipher (tail message) direction amount

  removeCaps :: String -> String
  removeCaps "" = ""
  removeCaps x = toLower (head x) : removeCaps (tail x)
  ignoreCaps :: String -> String -> Bool
  ignoreCaps x y = (removeCaps x) == (removeCaps y)

  shiftChar :: Char -> Int -> Char
  shiftChar x y = checkBounds (ord x + y) y

  checkBounds :: Int -> Int -> Char
  checkBounds x y = if (x-y>90)
    then checkBoundsLower x
    else checkBoundsUpper x

  checkBoundsLower :: Int -> Char
  checkBoundsLower x = if (x-97<0)
    then checkBoundsLower (26+x)
    else if (x-122>0)
      then checkBoundsLower (x-26)
      else chr x
  checkBoundsUpper :: Int -> Char
  checkBoundsUpper x = if (x-65<0)
    then checkBoundsUpper (26+x)
    else if (x-90>0)
      then checkBoundsUpper (x-26)
      else chr x

  unCipherCaeser :: String -> String -> Int -> String
  unCipherCaeser message direction amount = if (ignoreCaps direction "right")
    then caeserCipher message "left" amount
    else caeserCipher message "right" amount
