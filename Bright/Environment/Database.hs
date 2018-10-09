module Database where

  import Data.Time

  data DatabaseItem = DbString String
                    | DbNumber Integer
                    | DbDate UTCTime
                    deriving (Eq, Ord, Show)

  theDatabase :: [DatabaseItem]
  theDatabase =
    [DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)),
     DbNumber 9001,
     DbString "Hello World!",
     DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)),
     DbNumber 999,
     DbNumber 10
    ]

  filterDbDate :: [DatabaseItem] -> [UTCTime]
  filterDbDate x = foldr (\a b -> filterDates a ++ b) [] x

  filterDates :: DatabaseItem -> [UTCTime]
  filterDates (DbDate t) = [t]
  filterDates _ = []

  filterDbNumber :: [DatabaseItem] -> [Integer]
  filterDbNumber x = foldr (\a b -> filterNumbers a ++ b) [] x

  filterNumbers :: DatabaseItem -> [Integer]
  filterNumbers (DbNumber t) = [t]
  filterNumbers _ = []

  mostRecent :: [DatabaseItem] -> UTCTime
  mostRecent x = foldr compFunc (UTCTime (fromGregorian 0 0 0) (secondsToDiffTime 34123)) (filterDbDate x)

  compFunc :: UTCTime -> UTCTime ->UTCTime
  compFunc a b = if a<b
    then b
    else a

  sumDb :: [DatabaseItem] -> Integer
  sumDb x = foldr (+) 0 (filterDbNumber x)

  avgDb :: [DatabaseItem] -> Double
  avgDb x = (fromIntegral . sumDb) x / ((fromIntegral . length . filterDbNumber) x)
