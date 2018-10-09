module Chapter10Exercises where

  --10.5 Intermission
  question1 = foldr (*) 1 [1..5]    --120 = b,c
  question2 = foldl (flip (*)) 1 [1..5]
    --foldl (flip (*)) (1*1) [2..5]
    --foldl (flip (*)) (2*1) [3,4,5]
    --foldl (flip (*)) (3*2) [4,5]
    --foldl (flip (*)) (4*6) [5]
    --foldl (-flip (*)) (5*24) []
    --120

  --Chapter 10 Exercises
  stops = "pbtdkg"
  vowels = "aeiou"

  nouns = ["dog", "cat", "book", "computer", "Allah", "haskell", "computer", "cancer", "league"]
  verbs = ["ate", "ran", "swam", "though", "blew up", "wrote", "contracted"]

  --OH MY GOD, I didn't know there was an answer key, this method is SOOOOO dumb,
    --but I didn't know any other way at the time
  finalBoss = function1 stops vowels stops []
  function1 x y z list = step1 x y z list 0 where
    step1 x y z list counter
      |counter < (length x) = step1 x y z (function2 (x !! counter) y z list) (counter + 1)
      |otherwise = reverse list
  function2 x y z list = step2 x y z list 0 where
    step2 x y z list counter
      |counter < (length y) = step2 x y z (function3 x (y !! counter) z list) (counter + 1)
      |otherwise = list
  --function3 :: [a] -> [b] -> [c] -> [(a,b,c)] -> [(a,b,c)]
  function3 x y z list = step3 x y z list 0 where
    step3 x y z list counter
      |counter < (length z) = step3 x y z ((x, y, z !! counter) : list) (counter + 1)
      |otherwise = list
  --for (int x=0;x<stops.length;x++){
  --  for (int y=0;y<vowels.length;y++){
  --    for (intz=0;z<stops.length;z++){
  --      returnedArray.add((x,y,z))
  --      delete head of z
  --    }
  --    delete head of y
  --  }
  --  delete head of x
  --}

  pOnly = cancer finalBoss where
    cancer [] = []
    cancer (x:xs) = if (basedP x)
      then x : cancer xs
      else cancer xs
  basedP (a,b,c) = a=='p'

  --MUCH better way
  combosDo :: [a] -> [b] -> [c] -> [(a,b,c)]
  combosDo xs ys zs = [(x,y,z) | x <- xs, y <- ys, z <- zs]

  --Returns the average length of words inside of a string
  seekritFunc x = div (sum (map length (words x))) (length (words x))
  seekritFunc' x = fromIntegral (sum (map length (words x))) / (fromIntegral (length (words x)))
