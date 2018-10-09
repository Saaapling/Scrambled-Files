
import Data.Char

double n = n + n
doTwice f x = f (f x)
doTwice' f = f . f
quadruple = doTwice double

doFour = doTwice' doTwice'

isEven n =
  if n `mod` 2 == 0
    then True
    else False

isEven' n = (mod n 2) == 0

count [] = 0
count (x:xs) = 1 + (count xs)

factors n = filter (isFactor n) [1..n]
  where isFactor n k = (mod n k == 0)
isPrime n = (count $ factors n) == 2


pfac n
  | n <= 1    = []
  | otherwise = rec n 2
  where rec n try
          | try > n         = []
          | mod n try == 0  = try : rec (div n try) try
          | otherwise       = rec n (try + 1)

--pfac 90
--      = rec 90 2
--      = 2 : rec (div 90 2) 2
--      = 2 : rec 45 2
--      = 2 : rec 45 3
--      = 2 : 3 : rec (div 45 3) 3
--      = 2 : 3 : rec 15 3
--      = 2 : 3 : 3 : rec (div 15 3) 3
--      = 2 : 3 : 3 : rec 5 3
--      = 2 : 3 : 3 : rec 5 4
--      = 2 : 3 : 3 : rec 5 5
--      = 2 : 3 : 3 : 5 : rec (div 5 5) 5
--      = 2 : 3 : 3 : 5 : rec 1 5
--      = 2 : 3 : 3 : 5 : []
--      = 2 : 3 : 3 : [5]
--      = 2 : 3 : [3, 5]
--      = [2, 3, 3, 5]









isPrimeFast n = length (pfac n) == 1

isPrimeBlazing n =
  if n <= 1
    then False
    else null [x | x <- [2..limit], mod n x == 0]
      where limit = (floor . sqrt . fromIntegral) n

dist (x1, y1) (x2, y2) = sqrt (sq (x1-x2) + sq (y1-y2))
  where sq n = n * n



digits n
  | (n >= 0 && n <= 9) = [dig n]
  | n > 10 =
      let last = mod n 10
          rest = div n 10
      in  (digits rest) ++ (digits last)
  where dig n = chr ((ord '0') + n)

split "" ch = [""]
split (x:xs) ch
  | (x == ch) = ("" : (split xs ch))
  | (x /= ch) = ((x : (head rec)) : (tail rec))
      where rec = split xs ch

split' str item =
  case str of
    [] -> [[]]
    (x:xs) ->
      let rec = split' xs item
      in if x == item
            then [] : rec
            else (x : (head rec)) : (tail rec)


rotateVowels "" = ""
rotateVowels (c:cs) =
  case c of
    'a' -> 'e' : rotateVowels cs
    'e' -> 'i' : rotateVowels cs
    'i' -> 'o' : rotateVowels cs
    'o' -> 'u' : rotateVowels cs
    'u' -> 'a' : rotateVowels cs
    otherwise -> c : rotateVowels cs
