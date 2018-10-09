module Print3Broken where

  printSecond :: IO()
  printSecond = do
    putStrLn greeting where
      greeting = "YAAAAAAAAAAAR"

  main :: IO()
  main = do
    printSecond
    putStrLn $greeting ++ "  " ++  responce
    printSecond
    where
      greeting = "Yaaaaaaaar???"
      responce = "YAAAAAR!"
