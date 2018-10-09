module Tree where

  data BinaryTree a =
       Leaf
      |Node (BinaryTree a) a (BinaryTree a)
      deriving (Eq, Ord, Show)

  insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
  insert' b Leaf = Node Leaf b Leaf
  insert' b (Node left a right)
    | b == a = Node left a right
    | b < a = Node (insert' b left) a right
    | b > a = Node left a (insert' b right)

  mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
  mapTree _ Leaf = Leaf
  mapTree f (Node left a right) =
    Node (mapTree f left) (f a) (mapTree f right)

  testTree' :: BinaryTree Integer
  testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)
  mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

  -- acceptance test for mapTree
  mapOkay = if mapTree (+1) testTree' == mapExpected
    then print "yup okay!"
    else error "test failed!"

  convertList :: BinaryTree a -> [a]
  convertList Leaf = []
  convertList (Node left a right) = (convertList left) ++ [a] ++ (convertList right)

  quicksort :: Ord a => [a] -> [a]
  quicksort [] = []
  quicksort (x:xs) = (quicksort lesser) ++ [x] ++ (quicksort greater) where
    lesser = filter (< x) xs
    greater = filter (>= x) xs

  foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
  foldTree f b tree = foldr f b (convertList tree)
