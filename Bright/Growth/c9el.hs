module Chapter9Exercises where
  --How can I rewrite some of these functions using the (for-each) loops
  --that haskell inherently allows for lists?

  import Data.Char
  --9.6 Intermission
  myWords :: String -> [String]
  myWords sentence = seperate sentence [] where
    seperate fragment wordList
      |length fragment>0 = seperate (drop 1 (dropWhile (/=' ') fragment)) ((takeWhile (/=' ') fragment):wordList)
      |otherwise = reverse wordList

  firstSen = "Tyger Tyger, burning bright\n"
  secondSen = "In the forests of night \n"
  thirdSen = "What immortal hand or eye\n"
  fourthSen = "Could frame thy fearful symmetry"
  sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
  myLines :: String -> [String]
  myLines sentence = seperate sentence [] where
    seperate fragments lineList
      |length fragments>0 = seperate (drop 1 (dropWhile (/='\n') fragments)) ((takeWhile (/='\n') fragments):lineList)
      |otherwise = reverse lineList

  betterCuts :: String -> Char -> [String]
  betterCuts sentence character = seperate sentence character [] where
    seperate fragment char wordList
      |length fragment>0 = seperate (drop 1 (dropWhile (/=char) fragment)) char ((takeWhile (/=char) fragment):wordList)
      |otherwise = reverse wordList

  --9.7 List Generation Exercises
  mySqr = [x^2 | x <- [1..5]]
  myCube = [y^3 | y <- [1..5]]
  myTuples = [(x,y) | x <- mySqr, y <- myCube]
  myShorterTuples = [(x,y) | x <- mySqr, y <- myCube, x<50, y<50]
  listLength x = length x

  --9.10 Intermission
  mult3 = filter (\x -> (mod x 3 == 0)) [1..30]
  mult3' = [x | x <- [1..30], (mod x 3 == 0)]
  mult3comp = (length . filter (\x -> (mod x 3 == 0))) [1..30]

  noArticles x = [i | i <- (betterCuts x ' '), quickCheck i]
  --quickCheck x (_:["the", "a", "an"])
  quickCheck x = (x /= "the" && x /= "a" && x /= "an")

  --9.11 Intermission
  customZip :: [a] -> [b] -> [(a,b)]
  --customZip [] _ = []
  --customZip _ [] = []
  --customZip x y = (head x, head y) : customZip (tail x) (tail y)
  customZip x y = customZipWith (,) x y

  customZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
  customZipWith _ [] _ = []
  customZipWith _ _ [] = []
  customZipWith f x y = f (head x) (head y) : customZipWith f (tail x) (tail y)

  --Chapter 9 Exercises
  filterLower :: String -> String
  filterLower "" = ""
  filterLower xs = if (isUpper (head xs))
    then head xs : filterLower (tail xs)
    else filterLower (tail xs)

  capFirst :: String -> String
  capFirst x = toUpper (head x) : (tail x)

  shoutyCapitals :: String -> String
  shoutyCapitals "" = ""
  shoutyCapitals x = toUpper (head x) : shoutyCapitals (tail x)

  heads :: String -> Char
  --heads x = toUpper (head x)
  heads = (toUpper . head)
