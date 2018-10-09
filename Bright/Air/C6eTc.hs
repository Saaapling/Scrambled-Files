module Chapter6Excercises where
  import Data.List
  data Identity a =
    Identity a
  instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'

  data TisAnInteger a=
    TisAn Integer
  instance Eq (TisAnInteger a) where
    (==) (TisAn a) (TisAn a') = a == a'

  data TwoIntegers a a'=
    Two Integer Integer
  instance Eq a => Eq (TwoIntegers a a') where
    (==) (Two a b) (Two a' b') = a==a' && b==b'

  data StringOrInt a=
      TisAnInt Int
    | TisAString String
  instance (Eq a) => Eq (StringOrInt a) where
    (==) (TisAnInt a) (TisAnInt a') = a==a'
    (==) (TisAString a) (TisAString a') = a==a'

  data Pair a=
    Pairs a a
  instance (Eq a) => Eq (Pair a) where
    (==) (Pairs a b) (Pairs a' b') = a==a' && b==b'

  data Tuple a b =
    Tuple a b
  instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple a b) (Tuple a' b') = a==a' && b==b'

  data Which a =
      ThisOne a
    | ThatOne a
  instance (Eq a) => Eq (Which a) where
    (==) (ThisOne a) (ThisOne a') = a == a'
    (==) (ThatOne a) (ThatOne a') = a == a'
    (==) (ThisOne a) (ThatOne a') = a == a'
    (==) (ThatOne a) (ThisOne a') = a == a'

--  data EitherOr a b=
--      Hello a
--    | Goodbye b
--  instance (Eq a, Eq b) => Eq (EitherOr a b) where
--    (==) (Hello a Goodbye b) (Hello a' Goodbye b') = b == b'
    --p 206

  data Person = Person Bool deriving (Show)
  printPerson :: Person -> IO()
  printPerson person = putStrLn (show person)

  data Mood =
      Blah
    | Woot
    deriving (Show, Eq)
  settleDown x = if x == Woot
                 then Blah
                 else x

  type Subject = String
  type Verb = String
  type Object = String

  data Sentence = Sentence Subject Verb Object
                  deriving (Eq, Show)
  s1 = Sentence "dogs" "drool"
  s2 = Sentence "Julie" "loves" "dogs"


  data Rocks = Rocks String deriving (Eq, Show)
  data Yeah = Yeah Bool deriving (Eq, Show)
  data Papu = Papu Rocks Yeah deriving (Eq, Show)

  phew = Papu (Rocks "chases") (Yeah True)
  truth = Papu (Rocks "chomskydoz") (Yeah True)
  equalityForAll :: Papu -> Papu -> Bool
  equalityForAll p p' = p == p'
  --Broken, and cannot be fixed
  --comparePapus :: Papu -> Papu -> Bool
  --comparePapus p p' = p > p'

  i :: Num a => a
  --i :: a
  i = 1

  f' :: Float
  --f' :: Num a => a
  f' = 1.0

  f'' :: Float
  --f'' :: Fractional a => a
  f'' = 1.0

  f''' :: Float
  --f''' :: RealFrac a => a
  f''' = 1.0

  freud :: a -> a
  --freud :: Ord a => a -> a
  freud x = x

  freud' :: a -> a
  --freud' :: Int -> Int
  freud' x = x

  myX = 1 :: Int
  sigmund :: Int -> Int
  --sigmund :: a -> a
  sigmund x = myX

  jung :: Ord a => [a] -> a
  --jung :: [Int] -> Int
  jung xs = head (sort xs)

  young :: [Char] -> Char
  --young :: Ord a => [a] -> a
  young xs = head (sort xs)

  mySort :: [Char] -> [Char]
  mySort = sort
  signifier :: [Char] -> Char
  --signifier :: Ord a => a -> a
  signifier xs = head (mySort xs)

  --Type Kwon Do 2.0
  chk :: Eq b => (a -> b) -> a -> b -> Bool
  chk x y z = (x y) == z
  --chk show 123 "123"

  arith :: Num b => (a -> b) -> Integer -> a -> b
  arith = undefined
