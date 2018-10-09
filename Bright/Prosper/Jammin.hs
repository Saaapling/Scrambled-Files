module Jammin where
  import Data.List

  data Fruit = Peach | Plum | Apple | Blackberry deriving (Eq, Show, Ord)
  data JamJars = JamJars {type' :: Fruit, jars :: Int} deriving (Eq, Show, Ord)
    --Cardinality: 4 * (Cardinality of Int)

  row1 = JamJars Peach 10
  row2 = JamJars Plum 5
  row3 = JamJars Apple 12
  row4 = JamJars Blackberry 7
  row5 = JamJars Plum 2
  row6 = JamJars Apple 3
  allJam = [row1, row2, row3, row4, row5, row6]

  totalJars :: [JamJars] -> Int
  --Mark 1
    --totalJars [] = 0
    --totalJars (x:xs) = jars x + totalJars xs
  --Mark 2
    --totalJars = foldr (\a b -> b + (jars a)) 0
  --Mark 3
  totalJars x = foldr (+) 0 (map jars x)

  mostRow :: [JamJars] -> JamJars
  mostRow = foldr(\a b -> if (jars a > jars b) then a else b) (JamJars Peach 0)

  sortJarsAmt :: [JamJars] -> [JamJars]
  sortJarsAmt = sortBy (\a b -> compare (jars a) (jars b))

  sortJars :: [JamJars] -> [JamJars]
  sortJars = sortBy (\a b -> compare (type' a) (type' b))

  groupJars :: [JamJars] -> [[JamJars]]
  groupJars = ((groupBy (\a b -> (type' a == type' b))) . sortJars)
