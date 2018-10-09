module Chapter11Exercises where
  import Data.Char

  data PugType = PugData
    --Cardinality: 1
  data Airline = PapuAir
               | CatapultsR'Us
               | TakeYourChancesUnited
    --Cardinality: 3
  --Cardinality of Int16: 2^16
  --Caradinality of Int/Integer: Infinite

  data Example = MakeExample Integer deriving Show

  --11.11 Exercise
  data OperatingSystem =
         GnuPlusLinux
       | BSD
       | Mac
       | Windows
       deriving (Eq, Show)

  data ProgrammingLanguage =
         Haskell
       | Agda
       | Idris
       | Purescript
       deriving (Eq, Show)

  data Programmer = Programmer {os :: OperatingSystem,
                                lang :: ProgrammingLanguage}
                                deriving (Eq, Show)

  nineToFive :: Programmer
  nineToFive = Programmer {os = Mac, lang = Haskell}

  allOperatingSystems :: [OperatingSystem]
  allOperatingSystems = [GnuPlusLinux, BSD, Mac, Windows]
  allLanguages :: [ProgrammingLanguage]
  allLanguages = [Haskell, Agda, Idris, Purescript]

  allProgrammers :: [Programmer]
  allProgrammers = [Programmer {os=x, lang=y}|x<-allOperatingSystems, y<-allLanguages]

  --As Patterns, I did these wrong, but they work
  isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
  isSubsequenceOf [] _ = True
  isSubsequenceOf (x:xs) y = matcher x y where
    matcher _ [] = False
    matcher x (y:ys)
      |x==y = isSubsequenceOf xs ys
      |otherwise = matcher x ys

  capWords :: String -> [(String, String)]
  capWords x = tupling (wordList x) where
    tupling [] = []
    tupling (x:xs) = ((toUpper (head x) : tail x),(toLower (head x) : tail x)) : tupling xs

  wordList :: String -> [String]
  wordList [] = []
  wordList x = takeWhile (/=(' ')) x : wordList (drop 1 (dropWhile (/=(' ')) x))
